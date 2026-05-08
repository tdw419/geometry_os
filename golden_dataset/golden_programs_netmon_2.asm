; DESCRIPTION: Render a colored object at the screen.

; netmon.asm -- Phase 141: Network Packet Viewer
;
; Visual network packet monitor. Reads from /dev/net device,
; displays scrolling packet log with hex data and rate stats.
; Simulates traffic by writing random data to the net port.
;
; Layout:
;   Row 0-1: Title bar
;   Row 2-29: Scrolling packet log (colored bars per packet)
;   Row 30-31: Status bar with packet count and rate
;
; Opcodes: LDI, MOV, ADD, SUB, MUL, DIV, AND, OR, SHL, SHR, SAR
;          MOD, CMP, JZ, JNZ, BLT, BGE, JMP, FILL, RECTF, PSET
;          DRAWTEXT, TEXT, IKEY, RAND, FRAME, OPEN, READ, IOCTL
;          STORE, LOAD

; == INIT ==
    LDI r10, 1
    LDI r5, 0
    LDI r14, 0             ; total packets
    LDI r1, 0            ; rate counter
    LDI r0, 0            ; displayed rate
    LDI r13, 0            ; buffer head (0-31)
    LDI r22, 0x5000       ; packet buffer (32 entries, 4 words each)
    LDI r23, 32           ; max packets

    ; Open /dev/net
    LDI r8, net_path
    LDI r9, 0
    OPEN r8, r9
    MOV r11, r12            ; r11 = net fd

; == MAIN LOOP ==
main_loop:
    ; Dark background
    LDI r8, 0x080810
    FILL r8

    ; == SIMULATE PACKETS (every ~32 frames) ==
    LDI r8, 0xFFE
    LOAD r8, r8
    LDI r9, 31
    AND r8, r9
    LDI r9, 15
    CMP r8, r9
    JNZ r12, no_sim
    RAND r8
    LDI r9, 0xFFC
    STORE r9, r8
no_sim:

    ; == READ FROM /dev/net ==
    LDI r8, 0xFFC
    LDI r9, 1
    READ r11, r8, r9
    LDI r8, 0
    CMP r12, r8
    JZ r12, no_pkt

    ; Store packet
    LDI r8, 0xFFC
    LOAD r24, r8           ; data word

    ; Buffer[head*4 + 0] = data
    MOV r8, r13
    LDI r9, 2
    SHL r8, r9
    MOV r9, r22
    ADD r9, r8
    STORE r9, r24

    ; Buffer[head*4 + 1] = top byte (for color)
    MOV r8, r10
    ADD r9, r8
    MOV r3, r24
    LDI r6, 24
    SHR r3, r6             ; top byte
    STORE r9, r3

    ; Buffer[head*4 + 2] = TICKS at receipt
    MOV r8, r10
    ADD r9, r8
    LDI r3, 0xFFE
    LOAD r3, r3
    STORE r9, r3

    ; Advance head
    ADD r13, r10
    LDI r8, 32
    CMP r13, r8
    BLT r12, no_wrap
    LDI r13, 0
no_wrap:
    ADD r14, r10
    ADD r1, r10

no_pkt:
    ; == RATE UPDATE ==
    LDI r8, 0xFFE
    LOAD r7, r8
    LDI r8, 63
    AND r7, r8
    LDI r8, 2
    CMP r7, r8
    BGE r12, no_rate
    MOV r0, r1
    LDI r1, 0
no_rate:

    ; == TITLE BAR ==
    LDI r8, 0
    LDI r9, 0
    LDI r3, 256
    LDI r6, 14
    LDI r15, 0x003366
    RECTF r8, r9, r3, r6, r15

    LDI r16, 4
    LDI r17, 3
    LDI r18, title_str
    LDI r19, 0xFFFFFF
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

    ; Net status indicator
    LDI r8, 0xE003
    LDI r9, 0
    LDI r3, 0
    IOCTL r8, r9, r3
    LDI r8, 0
    CMP r12, r8
    JZ r12, net_down_label

    ; Net status indicator
    LDI r16, 90
    LDI r17, 3
    LDI r18, up_str
    LDI r19, 0x00FF00
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20
    JMP pkt_draw

net_down_label:
    LDI r16, 90
    LDI r17, 3
    LDI r18, down_str
    LDI r19, 0xFF0000
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

pkt_draw:
    ; == DRAW PACKET LOG ==
    ; Show last 28 packets as colored bars
    LDI r25, 0             ; display row (0-27)
    LDI r17, 16            ; start y

pkt_row:
    LDI r8, 0
    CMP r14, r8
    JZ r12, show_empty

    ; Determine entry index
    LDI r8, 28
    CMP r14, r8
    BGE r12, full_buf
    ; Partial: show rows 0..total-1
    CMP r25, r14
    BLT r12, do_draw_entry
    JMP skip_row

full_buf:
    ; entry = (head - 28 + row) & 31
    MOV r8, r13
    LDI r9, 28
    SUB r8, r9
    ADD r8, r25
    LDI r9, 31
    AND r8, r9

do_draw_entry:
    ; r8 = entry index
    LDI r9, 2
    SHL r8, r9             ; entry * 4
    MOV r3, r22
    ADD r3, r8             ; buffer base + offset

    ; Load color byte (word 1)
    MOV r9, r3
    ADD r9, r10
    LOAD r15, r9           ; color index (top byte of data)

    ; Generate color from the byte: hue mapping
    ; Use top 3 bits for hue channel selection
    LDI r6, 0xE0
    AND r15, r6            ; top 3 bits
    LDI r6, 5
    SHR r15, r6            ; shift to bits 8-10 range
    ; Create a visible color
    LDI r6, 0x44
    OR r15, r6             ; ensure minimum brightness

    ; Draw row bar
    LDI r8, 2
    LDI r9, 256
    LDI r6, 7
    RECTF r8, r17, r9, r6, r15

    ; Draw a bright accent line on left
    MOV r8, r3
    LOAD r4, r8           ; data word
    LDI r7, 16
    SHR r4, r7
    LDI r7, 0xF
    AND r4, r7
    LDI r7, 2
    MUL r4, r7
    ADD r4, r10             ; width = 3..33
    LDI r7, 0x00CCFF      ; cyan accent
    RECTF r8, r17, r4, r6, r7

skip_row:
    LDI r8, 8
    ADD r17, r8
    ADD r25, r10
    LDI r8, 28
    CMP r25, r8
    BLT r12, pkt_row
    JMP draw_stat

show_empty:
    LDI r16, 80
    LDI r17, 130
    LDI r18, empty_str
    LDI r19, 0x555555
    LDI r20, 0
    DRAWTEXT r16, r17, r18, r19, r20

draw_stat:
    ; == STATUS BAR ==
    LDI r8, 0
    LDI r9, 242
    LDI r3, 256
    LDI r6, 14
    LDI r15, 0x002244
    RECTF r8, r9, r3, r6, r15

    ; Build "PKT:N" at 0x6000
    LDI r8, 0x6000
    LDI r15, 80            ; 'P'
    STORE r8, r15
    ADD r8, r10
    LDI r15, 75
    STORE r8, r15
    ADD r8, r10
    LDI r15, 84
    STORE r8, r15
    ADD r8, r10
    LDI r15, 58
    STORE r8, r15
    ADD r8, r10
    LDI r15, 32
    STORE r8, r15
    ADD r8, r10

    ; Decimal convert r14
    MOV r9, r14
    LDI r3, 0x6020
    LDI r15, 0
    STORE r3, r15
    ; Special case: if r14 == 0, write '0'
    LDI r15, 0
    CMP r9, r15
    JNZ r12, dec_nonzero
    LDI r15, 48
    SUB r3, r10
    STORE r3, r15
    JMP dec_copy
dec_nonzero:
    LDI r27, 10
    MOV r28, r9
    DIV r28, r27
    MUL r28, r27
    MOV r29, r9
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r3, r10
    STORE r3, r29
    LDI r28, 10
    DIV r9, r28
    LDI r28, 0
    CMP r9, r28
    JNZ r12, dec_nonzero
dec_copy:
    LDI r8, 0x6005
dec_cp:
    LOAD r9, r3
    LDI r27, 0
    CMP r9, r27
    JZ r12, dec_cp_done
    STORE r8, r9
    ADD r8, r10
    ADD r3, r10
    JMP dec_cp
dec_cp_done:
    LDI r15, 0
    STORE r8, r15

    LDI r16, 4
    LDI r17, 244
    LDI r18, 0x6000
    LDI r19, 0xFFFFFF
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    ; Build "RATE:N/s" at 0x6030
    LDI r8, 0x6030
    LDI r15, 82
    STORE r8, r15
    ADD r8, r10
    LDI r15, 65
    STORE r8, r15
    ADD r8, r10
    LDI r15, 84
    STORE r8, r15
    ADD r8, r10
    LDI r15, 69
    STORE r8, r15
    ADD r8, r10
    LDI r15, 58
    STORE r8, r15
    ADD r8, r10
    LDI r15, 32
    STORE r8, r15
    ADD r8, r10

    ; Decimal convert r0
    MOV r9, r0
    LDI r3, 0x6050
    LDI r15, 0
    STORE r3, r15
    LDI r15, 0
    CMP r9, r15
    JNZ r12, rdec_nonzero
    LDI r15, 48
    SUB r3, r10
    STORE r3, r15
    JMP rdec_copy
rdec_nonzero:
    LDI r27, 10
    MOV r28, r9
    DIV r28, r27
    MUL r28, r27
    MOV r29, r9
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r3, r10
    STORE r3, r29
    LDI r28, 10
    DIV r9, r28
    LDI r28, 0
    CMP r9, r28
    JNZ r12, rdec_nonzero
rdec_copy:
    LDI r8, 0x6037
rdec_cp:
    LOAD r9, r3
    LDI r27, 0
    CMP r9, r27
    JZ r12, rdec_done
    STORE r8, r9
    ADD r8, r10
    ADD r3, r10
    JMP rdec_cp
rdec_done:
    LDI r15, 47
    STORE r8, r15
    ADD r8, r10
    LDI r15, 115
    STORE r8, r15
    ADD r8, r10
    LDI r15, 0
    STORE r8, r15

    LDI r16, 130
    LDI r17, 244
    LDI r18, 0x6030
    LDI r19, 0xFFFF00
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    FRAME
    JMP main_loop

; == DATA ==
.org 0x4000
net_path:
    .asciz "/dev/net"
    .db 0

title_str:
    .asciz "NETMON - Packet Viewer"
    .db 0

up_str:
    .asciz "UP"
    .db 0

down_str:
    .asciz "DOWN"
    .db 0

empty_str:
    .asciz "NO PACKETS YET"
    .db 0
