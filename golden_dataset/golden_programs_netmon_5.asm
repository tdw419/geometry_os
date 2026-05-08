; DESCRIPTION: A colored object centered at the screen with fixed size.

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
    LDI r14, 1
    LDI r0, 0
    LDI r15, 0             ; total packets
    LDI r4, 0            ; rate counter
    LDI r3, 0            ; displayed rate
    LDI r13, 0            ; buffer head (0-31)
    LDI r22, 0x5000       ; packet buffer (32 entries, 4 words each)
    LDI r23, 32           ; max packets

    ; Open /dev/net
    LDI r1, net_path
    LDI r2, 0
    OPEN r1, r2
    MOV r11, r10            ; r11 = net fd

; == MAIN LOOP ==
main_loop:
    ; Dark background
    LDI r1, 0x080810
    FILL r1

    ; == SIMULATE PACKETS (every ~32 frames) ==
    LDI r1, 0xFFE
    LOAD r1, r1
    LDI r2, 31
    AND r1, r2
    LDI r2, 15
    CMP r1, r2
    JNZ r10, no_sim
    RAND r1
    LDI r2, 0xFFC
    STORE r2, r1
no_sim:

    ; == READ FROM /dev/net ==
    LDI r1, 0xFFC
    LDI r2, 1
    READ r11, r1, r2
    LDI r1, 0
    CMP r10, r1
    JZ r10, no_pkt

    ; Store packet
    LDI r1, 0xFFC
    LOAD r24, r1           ; data word

    ; Buffer[head*4 + 0] = data
    MOV r1, r13
    LDI r2, 2
    SHL r1, r2
    MOV r2, r22
    ADD r2, r1
    STORE r2, r24

    ; Buffer[head*4 + 1] = top byte (for color)
    MOV r1, r14
    ADD r2, r1
    MOV r12, r24
    LDI r5, 24
    SHR r12, r5             ; top byte
    STORE r2, r12

    ; Buffer[head*4 + 2] = TICKS at receipt
    MOV r1, r14
    ADD r2, r1
    LDI r12, 0xFFE
    LOAD r12, r12
    STORE r2, r12

    ; Advance head
    ADD r13, r14
    LDI r1, 32
    CMP r13, r1
    BLT r10, no_wrap
    LDI r13, 0
no_wrap:
    ADD r15, r14
    ADD r4, r14

no_pkt:
    ; == RATE UPDATE ==
    LDI r1, 0xFFE
    LOAD r6, r1
    LDI r1, 63
    AND r6, r1
    LDI r1, 2
    CMP r6, r1
    BGE r10, no_rate
    MOV r3, r4
    LDI r4, 0
no_rate:

    ; == TITLE BAR ==
    LDI r1, 0
    LDI r2, 0
    LDI r12, 256
    LDI r5, 14
    LDI r7, 0x003366
    RECTF r1, r2, r12, r5, r7

    LDI r16, 4
    LDI r17, 3
    LDI r18, title_str
    LDI r19, 0xFFFFFF
    LDI r20, 0x003366
    DRAWTEXT r16, r17, r18, r19, r20

    ; Net status indicator
    LDI r1, 0xE003
    LDI r2, 0
    LDI r12, 0
    IOCTL r1, r2, r12
    LDI r1, 0
    CMP r10, r1
    JZ r10, net_down_label

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
    LDI r1, 0
    CMP r15, r1
    JZ r10, show_empty

    ; Determine entry index
    LDI r1, 28
    CMP r15, r1
    BGE r10, full_buf
    ; Partial: show rows 0..total-1
    CMP r25, r15
    BLT r10, do_draw_entry
    JMP skip_row

full_buf:
    ; entry = (head - 28 + row) & 31
    MOV r1, r13
    LDI r2, 28
    SUB r1, r2
    ADD r1, r25
    LDI r2, 31
    AND r1, r2

do_draw_entry:
    ; r1 = entry index
    LDI r2, 2
    SHL r1, r2             ; entry * 4
    MOV r12, r22
    ADD r12, r1             ; buffer base + offset

    ; Load color byte (word 1)
    MOV r2, r12
    ADD r2, r14
    LOAD r7, r2           ; color index (top byte of data)

    ; Generate color from the byte: hue mapping
    ; Use top 3 bits for hue channel selection
    LDI r5, 0xE0
    AND r7, r5            ; top 3 bits
    LDI r5, 5
    SHR r7, r5            ; shift to bits 8-10 range
    ; Create a visible color
    LDI r5, 0x44
    OR r7, r5             ; ensure minimum brightness

    ; Draw row bar
    LDI r1, 2
    LDI r2, 256
    LDI r5, 7
    RECTF r1, r17, r2, r5, r7

    ; Draw a bright accent line on left
    MOV r1, r12
    LOAD r8, r1           ; data word
    LDI r6, 16
    SHR r8, r6
    LDI r6, 0xF
    AND r8, r6
    LDI r6, 2
    MUL r8, r6
    ADD r8, r14             ; width = 3..33
    LDI r6, 0x00CCFF      ; cyan accent
    RECTF r1, r17, r8, r5, r6

skip_row:
    LDI r1, 8
    ADD r17, r1
    ADD r25, r14
    LDI r1, 28
    CMP r25, r1
    BLT r10, pkt_row
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
    LDI r1, 0
    LDI r2, 242
    LDI r12, 256
    LDI r5, 14
    LDI r7, 0x002244
    RECTF r1, r2, r12, r5, r7

    ; Build "PKT:N" at 0x6000
    LDI r1, 0x6000
    LDI r7, 80            ; 'P'
    STORE r1, r7
    ADD r1, r14
    LDI r7, 75
    STORE r1, r7
    ADD r1, r14
    LDI r7, 84
    STORE r1, r7
    ADD r1, r14
    LDI r7, 58
    STORE r1, r7
    ADD r1, r14
    LDI r7, 32
    STORE r1, r7
    ADD r1, r14

    ; Decimal convert r15
    MOV r2, r15
    LDI r12, 0x6020
    LDI r7, 0
    STORE r12, r7
    ; Special case: if r15 == 0, write '0'
    LDI r7, 0
    CMP r2, r7
    JNZ r10, dec_nonzero
    LDI r7, 48
    SUB r12, r14
    STORE r12, r7
    JMP dec_copy
dec_nonzero:
    LDI r27, 10
    MOV r28, r2
    DIV r28, r27
    MUL r28, r27
    MOV r29, r2
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r12, r14
    STORE r12, r29
    LDI r28, 10
    DIV r2, r28
    LDI r28, 0
    CMP r2, r28
    JNZ r10, dec_nonzero
dec_copy:
    LDI r1, 0x6005
dec_cp:
    LOAD r2, r12
    LDI r27, 0
    CMP r2, r27
    JZ r10, dec_cp_done
    STORE r1, r2
    ADD r1, r14
    ADD r12, r14
    JMP dec_cp
dec_cp_done:
    LDI r7, 0
    STORE r1, r7

    LDI r16, 4
    LDI r17, 244
    LDI r18, 0x6000
    LDI r19, 0xFFFFFF
    LDI r20, 0x002244
    DRAWTEXT r16, r17, r18, r19, r20

    ; Build "RATE:N/s" at 0x6030
    LDI r1, 0x6030
    LDI r7, 82
    STORE r1, r7
    ADD r1, r14
    LDI r7, 65
    STORE r1, r7
    ADD r1, r14
    LDI r7, 84
    STORE r1, r7
    ADD r1, r14
    LDI r7, 69
    STORE r1, r7
    ADD r1, r14
    LDI r7, 58
    STORE r1, r7
    ADD r1, r14
    LDI r7, 32
    STORE r1, r7
    ADD r1, r14

    ; Decimal convert r3
    MOV r2, r3
    LDI r12, 0x6050
    LDI r7, 0
    STORE r12, r7
    LDI r7, 0
    CMP r2, r7
    JNZ r10, rdec_nonzero
    LDI r7, 48
    SUB r12, r14
    STORE r12, r7
    JMP rdec_copy
rdec_nonzero:
    LDI r27, 10
    MOV r28, r2
    DIV r28, r27
    MUL r28, r27
    MOV r29, r2
    SUB r29, r28
    LDI r28, 48
    ADD r29, r28
    SUB r12, r14
    STORE r12, r29
    LDI r28, 10
    DIV r2, r28
    LDI r28, 0
    CMP r2, r28
    JNZ r10, rdec_nonzero
rdec_copy:
    LDI r1, 0x6037
rdec_cp:
    LOAD r2, r12
    LDI r27, 0
    CMP r2, r27
    JZ r10, rdec_done
    STORE r1, r2
    ADD r1, r14
    ADD r12, r14
    JMP rdec_cp
rdec_done:
    LDI r7, 47
    STORE r1, r7
    ADD r1, r14
    LDI r7, 115
    STORE r1, r7
    ADD r1, r14
    LDI r7, 0
    STORE r1, r7

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
