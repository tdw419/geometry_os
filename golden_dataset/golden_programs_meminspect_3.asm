; DESCRIPTION: Draws a red object at the screen with fixed size.

; meminspect.asm -- Memory Inspector for Geometry OS
;
; Phase 76: Memory Inspector
;
; Hex dump of RAM regions with ASCII alongside hex.
; Arrow keys to scroll, number keys 0-9 jump to addr*256.
;
; RAM Layout:
;   0x6000-0x60FF   String buffers
;   0x6200-0x62FF   Hex scratch
;   0x6400-0x640F   Hex digit lookup
;   0x6500          Current view address
;   0x6501          Scroll offset (rows)
;
; Screen: 14 rows of 8 bytes with hex + ASCII

#define KEY_PORT  0xFFF
#define BUF       0x6000
#define HEX_BUF   0x6200
#define HEX_TABLE 0x6400
#define VIEW_ADDR 0x6500
#define ROW_SCROLL 0x6501

LDI r30, 0xFD00
LDI r15, 1

; =========================================
; Init hex table "0123456789ABCDEF"
; =========================================
LDI r20, HEX_TABLE
LDI r21, 48
STORE r20, r21
ADD r20, r15
LDI r21, 49
STORE r20, r21
ADD r20, r15
LDI r21, 50
STORE r20, r21
ADD r20, r15
LDI r21, 51
STORE r20, r21
ADD r20, r15
LDI r21, 52
STORE r20, r21
ADD r20, r15
LDI r21, 53
STORE r20, r21
ADD r20, r15
LDI r21, 54
STORE r20, r21
ADD r20, r15
LDI r21, 55
STORE r20, r21
ADD r20, r15
LDI r21, 56
STORE r20, r21
ADD r20, r15
LDI r21, 57
STORE r20, r21
ADD r20, r15
LDI r21, 65
STORE r20, r21
ADD r20, r15
LDI r21, 66
STORE r20, r21
ADD r20, r15
LDI r21, 67
STORE r20, r21
ADD r20, r15
LDI r21, 68
STORE r20, r21
ADD r20, r15
LDI r21, 69
STORE r20, r21
ADD r20, r15
LDI r21, 70
STORE r20, r21

; Init state
LDI r20, VIEW_ADDR
LDI r9, 0x2000
STORE r20, r9
LDI r20, ROW_SCROLL
LDI r9, 0
STORE r20, r9

; Demo data at 0x2000
LDI r20, 0x2000
LDI r21, 72
STORE r20, r21
ADD r20, r15
LDI r21, 101
STORE r20, r21
ADD r20, r15
LDI r21, 108
STORE r20, r21
ADD r20, r15
LDI r21, 108
STORE r20, r21
ADD r20, r15
LDI r21, 111
STORE r20, r21
ADD r20, r15
LDI r21, 44
STORE r20, r21
ADD r20, r15
LDI r21, 32
STORE r20, r21
ADD r20, r15
LDI r21, 87
STORE r20, r21

; =========================================
; MAIN LOOP
; =========================================
main_loop:
  IKEY r6

  LDI r13, 38
  CMP r6, r13
  JZ r5, do_up

  LDI r13, 40
  CMP r6, r13
  JZ r5, do_down

  ; Number keys 0-9
  LDI r13, 48
  CMP r6, r13
  BLT r5, do_draw

  LDI r13, 58
  CMP r6, r13
  BGE r5, do_draw

  LDI r13, 48
  SUB r6, r13
  LDI r13, 256
  MUL r6, r13
  LDI r20, VIEW_ADDR
  STORE r20, r6
  LDI r20, ROW_SCROLL
  LDI r9, 0
  STORE r20, r9
  JMP do_draw

do_up:
  LDI r20, ROW_SCROLL
  LOAD r9, r20
  LDI r13, 0
  CMP r9, r13
  JZ r5, do_draw
  SUB r9, r15
  STORE r20, r9
  JMP do_draw

do_down:
  LDI r20, ROW_SCROLL
  LOAD r9, r20
  ADD r9, r15
  LDI r13, 32
  CMP r9, r13
  BGE r5, do_draw
  STORE r20, r9
  JMP do_draw

; =========================================
; DRAW
; =========================================
do_draw:
  ; Background
  LDI r8, 0x080818
  FILL r8

  ; Title bar
  LDI r8, 0
  LDI r12, 0
  LDI r3, 256
  LDI r0, 16
  LDI r4, 0x004488
  RECTF r8, r12, r3, r0, r4

  LDI r20, BUF
  STRO r20, "Memory Inspector"
  LDI r8, 30
  LDI r12, 3
  LDI r3, BUF
  LDI r0, 0xFFFFFF
  LDI r4, 0x004488
  DRAWTEXT r8, r12, r3, r0, r4

  ; Compute effective start address
  LDI r20, VIEW_ADDR
  LOAD r14, r20
  LDI r20, ROW_SCROLL
  LOAD r7, r20
  LDI r13, 8
  MUL r7, r13
  ADD r14, r7          ; r14 = start addr for display

  ; Draw 14 hex dump rows
  LDI r10, 0            ; row counter
  LDI r1, 22           ; y position

  ; Note: no CALL inside this loop, all inline

nxt_row:
  ; Build address in BUF (4 hex chars)
  LDI r21, BUF
  ; Extract nibbles from r14 (only low 16 bits for display)
  LDI r22, 12
nxt_addr_nib:
  MOV r7, r14
  MOV r16, r22
  SHR r7, r16
  LDI r16, 0xF
  AND r7, r16
  LDI r16, HEX_TABLE
  ADD r16, r7
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r15
  SUB r22, r15
  LDI r16, 0
  CMP r22, r16
  BLT r5, addr_done
  ; But we need 4 digits only (bits 15:0), so iterate 4 times with shifts 12,8,4,0
  ; Actually we want 8 hex digits for full u32
  ; Let's just do the full 8-digit address
  LDI r16, 0
  CMP r22, r16
  JNZ r5, nxt_addr_nib
addr_done:
  ; Hmm, this loop structure is wrong. Let me do it simpler.
  ; Just write 4 hex digits for the low 16 bits

  ; Actually, let me inline it simply:
  ; Build "XXXX:" where XXXX is the address in hex
  LDI r21, BUF

  ; Nibble 3 (bits 15:12)
  MOV r7, r14
  LDI r16, 12
  SHR r7, r16
  LDI r16, 0xF
  AND r7, r16
  LDI r16, HEX_TABLE
  ADD r16, r7
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r15

  ; Nibble 2 (bits 11:8)
  MOV r7, r14
  LDI r16, 8
  SHR r7, r16
  LDI r16, 0xF
  AND r7, r16
  LDI r16, HEX_TABLE
  ADD r16, r7
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r15

  ; Nibble 1 (bits 7:4)
  MOV r7, r14
  LDI r16, 4
  SHR r7, r16
  LDI r16, 0xF
  AND r7, r16
  LDI r16, HEX_TABLE
  ADD r16, r7
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r15

  ; Nibble 0 (bits 3:0)
  MOV r7, r14
  LDI r16, 0xF
  AND r7, r16
  LDI r16, HEX_TABLE
  ADD r16, r7
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r15

  ; Colon + space
  LDI r16, 58           ; ':'
  STORE r21, r16
  ADD r21, r15
  LDI r16, 32           ; ' '
  STORE r21, r16
  ADD r21, r15

  ; Read 8 bytes, write hex
  MOV r26, r14
  LDI r25, 0
nxt_byte:
  LOAD r9, r26

  ; High nibble
  LDI r8, 4
  SHR r9, r8
  LDI r8, 0xF
  AND r9, r8
  LDI r8, HEX_TABLE
  ADD r8, r9
  LOAD r8, r8
  STORE r21, r8
  ADD r21, r15

  ; Low nibble
  LOAD r9, r26
  LDI r8, 0xF
  AND r9, r8
  LDI r8, HEX_TABLE
  ADD r8, r9
  LOAD r8, r8
  STORE r21, r8
  ADD r21, r15

  ; Space
  LDI r8, 32
  STORE r21, r8
  ADD r21, r15

  ADD r26, r15
  ADD r25, r15
  LDI r8, 8
  CMP r25, r8
  BLT r5, nxt_byte

  ; " |" separator
  LDI r8, 32
  STORE r21, r8
  ADD r21, r15
  LDI r8, 124          ; '|'
  STORE r21, r8
  ADD r21, r15

  ; ASCII
  MOV r26, r14
  LDI r25, 0
nxt_ascii:
  LOAD r9, r26
  LDI r8, 32
  CMP r9, r8
  BLT r5, put_dot
  LDI r8, 127
  CMP r9, r8
  BGE r5, put_dot
  STORE r21, r9
  JMP nxt_asc2
put_dot:
  LDI r8, 46
  STORE r21, r8
nxt_asc2:
  ADD r21, r15
  ADD r26, r15
  ADD r25, r15
  LDI r8, 8
  CMP r25, r8
  BLT r5, nxt_ascii

  ; Trailing | and null
  LDI r8, 124
  STORE r21, r8
  ADD r21, r15
  LDI r8, 0
  STORE r21, r8

  ; Draw
  LDI r8, 2
  MOV r12, r1
  LDI r3, BUF
  LDI r0, 0xCCCCCC
  LDI r4, 0x080818
  DRAWTEXT r8, r12, r3, r0, r4

  ; Advance by 8
  LDI r13, 8
  ADD r14, r13
  LDI r13, 15
  ADD r1, r13
  ADD r10, r15
  LDI r13, 14
  CMP r10, r13
  BLT r5, nxt_row

  ; Status bar
  LDI r8, 0
  LDI r12, 236
  LDI r3, 256
  LDI r0, 20
  LDI r4, 0x1A1A2E
  RECTF r8, r12, r3, r0, r4

  LDI r20, BUF
  STRO r20, "Up/Dn:Scroll 0-9:Jump"
  LDI r8, 4
  LDI r12, 238
  LDI r3, BUF
  LDI r0, 0x888888
  LDI r4, 0x1A1A2E
  DRAWTEXT r8, r12, r3, r0, r4

  FRAME
  JMP main_loop
