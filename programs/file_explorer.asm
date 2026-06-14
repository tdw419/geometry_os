; file_explorer.asm -- VFS File Explorer for Geometry OS
;
; Lists VFS files with names, supports cursor nav and content preview.
;
; Controls:
;   Up/Down:  Navigate / scroll preview
;   Enter:    Open file for preview
;   Escape:   Back to file list
;
; Memory:
;   0x5000-0x50FF  String buffer
;   0x5100-0x5FFF  LS buffer
;   0x6000         File count
;   0x6001         Selected index
;   0x6002         Mode: 0=browse, 1=preview
;   0x6003         Preview scroll
;   0x6004         Preview file handle
;   0x6100-0x61FF  File sizes
;   0x3000-0x37FF  Preview content

#define SB       0x5000
#define LB       0x5100
#define CNT      0x6000
#define IDX      0x6001
#define MODE     0x6002
#define PSL      0x6003
#define PFD      0x6004
#define SZ       0x6100
#define CB       0x3000

; ── Init ──
    LDI r30, 0xFD00
    LDI r24, 1           ; inc
    LDI r23, 0xFFB       ; key port

    LDI r0, 0
    LDI r2, CNT
    STORE r2, r0
    LDI r2, IDX
    STORE r2, r0
    LDI r2, MODE
    STORE r2, r0
    LDI r2, PSL
    STORE r2, r0
    LDI r2, PFD
    STORE r2, r0

    CALL refresh

; ── Main ──
main:
    LDI r2, MODE
    LOAD r0, r2
    JNZ r0, premode

    LOAD r3, r23
    JZ r3, tick

    MOV r4, r3
    LDI r5, 1
    AND r4, r5
    JNZ r4, k_up

    MOV r4, r3
    LDI r5, 2
    AND r4, r5
    JNZ r4, k_dn

    MOV r4, r3
    LDI r5, 32
    AND r4, r5
    JNZ r4, k_enter

    MOV r4, r3
    LDI r5, 16
    AND r4, r5
    JNZ r4, k_enter

    JMP tick

k_up:
    LDI r2, IDX
    LOAD r0, r2
    JZ r0, tick
    SUB r0, r24
    STORE r2, r0
    CALL refresh
    JMP tick

k_dn:
    LDI r2, IDX
    LOAD r0, r2
    ADD r0, r24
    LDI r3, CNT
    LOAD r3, r3
    SUB r3, r24
    CMP r0, r3
    BGE r0, tick
    STORE r2, r0
    CALL refresh
    JMP tick

k_enter:
    LDI r2, MODE
    LDI r0, 1
    STORE r2, r0

    ; Find selected filename
    LDI r2, IDX
    LOAD r0, r2
    LDI r13, LB
    LDI r6, 0

ff:
    CMP r6, r0
    JZ r0, ff_found
ff_a:
    LOAD r2, r13
    JZ r2, ff_ad
    ADD r13, r24
    JMP ff_a
ff_ad:
    ADD r13, r24
    ADD r6, r24
    JMP ff

ff_found:
    LDI r20, SB
    MOV r7, r13
ff_cp:
    LOAD r2, r7
    JZ r2, ff_cpd
    STORE r20, r2
    ADD r7, r24
    ADD r20, r24
    JMP ff_cp
ff_cpd:
    LDI r2, 0
    STORE r20, r2

    ; OPEN for read
    LDI r1, SB
    LDI r2, 0
    OPEN r1, r2
    LDI r2, PFD
    STORE r2, r0

    LDI r2, 0xFFFFFFFF
    CMP r0, r2
    JZ r0, eopen

    ; READ
    LDI r1, CB
    LDI r2, 1800
    READ r0, r1, r2

    LDI r1, CB
    ADD r1, r0
    LDI r2, 0
    STORE r1, r2

    LDI r2, PSL
    LDI r0, 0
    STORE r2, r0

    CALL draw_prev
    JMP tick

eopen:
    LDI r0, 0x000022
    FILL r0
    LDI r20, SB
    STRO r20, "Cannot open file"
    LDI r10, 60
    LDI r11, 120
    LDI r12, SB
    LDI r13, 0xFF4444
    LDI r14, 0x000022
    DRAWTEXT r10, r11, r12, r13, r14
    JMP tick

; ── Draw Preview ──
draw_prev:
    PUSH r31

    LDI r0, 0x0D0D1A
    FILL r0

    ; Title
    LDI r0, 0x222266
    LDI r15, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 14
    RECTF r15, r16, r17, r18, r0

    LDI r2, IDX
    LOAD r0, r2
    LDI r13, LB
    LDI r6, 0
ff2:
    CMP r6, r0
    JZ r0, ff2_f
ff2_a:
    LOAD r2, r13
    JZ r2, ff2_ad
    ADD r13, r24
    JMP ff2_a
ff2_ad:
    ADD r13, r24
    ADD r6, r24
    JMP ff2

ff2_f:
    LDI r20, SB
    STRO r20, "Preview: "
    LDI r20, SB
    ADDI r20, 9
    MOV r7, r13
ff2_cp:
    LOAD r2, r7
    JZ r2, ff2_cpd
    STORE r20, r2
    ADD r7, r24
    ADD r20, r24
    JMP ff2_cp
ff2_cpd:
    LDI r2, 0
    STORE r20, r2

    LDI r10, 8
    LDI r11, 3
    LDI r12, SB
    LDI r13, 0xAAAAFF
    LDI r14, 0x222266
    DRAWTEXT r10, r11, r12, r13, r14

    ; Display content
    LDI r2, PSL
    LOAD r8, r2
    LDI r13, CB
    LDI r16, 18

    ; Skip lines
    MOV r7, r8
skl:
    CMP r7, r24
    BLT r0, skd
skn:
    LOAD r2, r13
    JZ r2, sknd
    LDI r3, 10
    CMP r2, r3
    JZ r0, sknd
    ADD r13, r24
    JMP skn
sknd:
    ADD r13, r24
    SUB r7, r24
    JMP skl
skd:

    ; Draw visible lines
    LDI r8, 240
pvl:
    CMP r16, r8
    BGE r0, pvf

    MOV r17, r13
    LDI r10, 4
    MOV r11, r16
    MOV r12, r17
    LDI r18, 0xCCCCCC
    LDI r19, 0x0D0D1A
    DRAWTEXT r10, r11, r12, r18, r19

apv:
    LOAD r2, r17
    JZ r2, apvd
    LDI r3, 10
    CMP r2, r3
    JZ r0, apvd
    ADD r17, r24
    JMP apv
apvd:
    ADD r17, r24
    MOV r13, r17
    ADD r16, r24
    ADDI r16, 9
    JMP pvl

pvf:
    LDI r0, 0x224422
    LDI r15, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r15, r16, r17, r18, r0

    LDI r20, SB
    STRO r20, "Esc: back | Up/Down: scroll"
    LDI r10, 6
    LDI r11, 246
    LDI r12, SB
    LDI r13, 0x88CC88
    LDI r14, 0x224422
    DRAWTEXT r10, r11, r12, r13, r14

    POP r31
    RET

; ── Preview Mode ──
premode:
    LOAD r3, r23
    JZ r3, tick

    MOV r4, r3
    LDI r5, 1
    AND r4, r5
    JNZ r4, prv_up

    MOV r4, r3
    LDI r5, 2
    AND r4, r5
    JNZ r4, prv_dn

    JMP ext_prv

prv_up:
    LDI r2, PSL
    LOAD r0, r2
    JZ r0, tick
    SUB r0, r24
    STORE r2, r0
    CALL draw_prev
    JMP tick

prv_dn:
    LDI r2, PSL
    LOAD r0, r2
    ADD r0, r24
    STORE r2, r0
    CALL draw_prev
    JMP tick

ext_prv:
    LDI r2, PFD
    LOAD r0, r2
    LDI r2, 0xFFFFFFFF
    CMP r0, r2
    JZ r0, skc
    CLOSE r0
skc:
    LDI r2, MODE
    LDI r0, 0
    STORE r2, r0
    LDI r2, PFD
    LDI r0, 0
    STORE r2, r0
    CALL refresh
    JMP tick

; ── Tick ──
tick:
    FRAME
    JMP main

; ── Refresh ──
refresh:
    PUSH r31

    ; LS
    LDI r5, LB
    LS r5
    LDI r2, CNT
    STORE r2, r0
    MOV r10, r0

    ; Get sizes
    LDI r11, LB
    LDI r12, SZ
    MOV r14, r10

szl:
    JZ r14, drfiles

    ; VSTAT
    MOV r9, r11
    VSTAT r9
    STORE r12, r0

as:
    LOAD r2, r11
    JZ r2, asd
    ADD r11, r24
    JMP as
asd:
    ADD r11, r24
    ADD r12, r24
    SUB r14, r24
    JMP szl

; ── Draw File List ──
drfiles:
    ; Background
    LDI r0, 0x111122
    FILL r0

    ; Title bar
    LDI r0, 0x222266
    LDI r15, 0
    LDI r16, 0
    LDI r17, 256
    LDI r18, 14
    RECTF r15, r16, r17, r18, r0

    LDI r20, SB
    STRO r20, "VFS File Explorer"
    LDI r10, 8
    LDI r11, 3
    LDI r12, SB
    LDI r13, 0xFFFFFF
    LDI r14, 0x222266
    DRAWTEXT r10, r11, r12, r13, r14

    LDI r2, CNT
    LOAD r10, r2
    LDI r2, IDX
    LOAD r11, r2

    JZ r10, nofils

    ; Draw entries
    LDI r13, LB
    LDI r14, SZ
    LDI r15, 0
    LDI r16, 16

drl:
    LDI r2, 240
    CMP r16, r2
    BGE r0, drft

    CMP r15, r10
    BGE r0, drft

    LOAD r3, r13
    JZ r3, drft

    ; Selection highlight
    CMP r15, r11
    JNZ r0, dnor
    LDI r0, 0x444488
    LDI r1, 0
    LDI r2, 256
    LDI r3, 12
    RECTF r1, r16, r2, r3, r0
    LDI r18, 0xFFFFFF
    JMP drnm

dnor:
    LDI r18, 0xCCCCCC

drnm:
    ; Draw filename (use registers 1-4 for DRAWTEXT to avoid clobbering r13/r14)
    LDI r10, 6
    MOV r11, r16
    ADD r11, r24
    MOV r12, r13
    ; r18 already has fg color
    LDI r19, 0x111122
    DRAWTEXT r10, r11, r12, r18, r19

    ; Draw size at right
    LOAD r0, r14
    ; Simple: show hex size
    LDI r20, SB
    ; Write size as decimal using simple approach
    ; Format: B for bytes
    LDI r3, 1024
    CMP r0, r3
    BLT r0, sz_lt1k
    ; >= 1KB: divide by 1024
    MOV r4, r0
    LDI r6, 0
szk:
    CMP r4, r3
    BLT r0, szkd
    SUB r4, r3
    ADD r6, r24
    JMP szk
szkd:
    ; r6 = KB
    ADDI r6, 48
    STORE r20, r6
    ADD r20, r24
    LDI r7, 0x4B           ; 'K'
    STORE r20, r7
    ADD r20, r24
    LDI r7, 0x42           ; 'B'
    STORE r20, r7
    ADD r20, r24
    LDI r7, 0
    STORE r20, r7
    JMP szdn

sz_lt1k:
    ; Raw bytes (< 1024)
    MOV r4, r0
    ; Convert to decimal
    LDI r5, 100
    LDI r6, 0
szh:
    CMP r4, r5
    BLT r0, szhd
    SUB r4, r5
    ADD r6, r24
    JMP szh
szhd:
    ADDI r6, 48
    STORE r20, r6
    ADD r20, r24

    LDI r5, 10
    MOV r4, r0
    LDI r6, 0
szt:
    CMP r4, r5
    BLT r0, sztd
    SUB r4, r5
    ADD r6, r24
    JMP szt
sztd:
    ADDI r6, 48
    STORE r20, r6
    ADD r20, r24

    MOV r4, r0
    ADDI r4, 48
    STORE r20, r4
    ADD r20, r24
    LDI r7, 0
    STORE r20, r7

szdn:
    LDI r10, 200
    MOV r11, r16
    ADD r11, r24
    LDI r12, SB
    LDI r18, 0x88AA88
    LDI r19, 0x111122
    DRAWTEXT r10, r11, r12, r18, r19

    ; Advance
ad:
    LOAD r2, r13
    JZ r2, addn
    ADD r13, r24
    JMP ad
addn:
    ADD r13, r24
    ADD r14, r24
    ADD r15, r24
    ADDI r16, 11
    JMP drl

drft:
    LDI r0, 0x224422
    LDI r15, 0
    LDI r16, 244
    LDI r17, 256
    LDI r18, 12
    RECTF r15, r16, r17, r18, r0

    LDI r20, SB
    LDI r2, CNT
    LOAD r0, r2
    ADDI r0, 48
    STORE r20, r0
    ADD r20, r24
    STRO r20, " files  Arrows: nav  Enter: open"

    LDI r10, 6
    LDI r11, 246
    LDI r12, SB
    LDI r13, 0x88CC88
    LDI r14, 0x224422
    DRAWTEXT r10, r11, r12, r13, r14

    POP r31
    RET

nofils:
    LDI r10, 80
    LDI r11, 120
    LDI r20, SB
    STRO r20, "(no VFS files)"
    LDI r13, 0xFF4444
    LDI r14, 0x111122
    DRAWTEXT r10, r11, r12, r13, r14
    POP r31
    RET
