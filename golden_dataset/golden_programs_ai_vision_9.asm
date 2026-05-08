; DESCRIPTION: A red square centered at the screen with fixed size.

; ai_vision.asm -- Phase 88: AI Vision Bridge demo
;
; Demonstrates the AI_AGENT opcode:
;   op=0: screenshot to VFS file
;   op=1: canvas checksum
;   op=3: vision API call (with mock response)
;
; The program draws red bars, takes a checksum,
; modifies the screen, takes another checksum, and calls the vision API.

; ── Draw red bars ──
LDI r9, 1
LDI r14, 0xFF0000   ; red
LDI r15, 0          ; y = 0
LDI r13, 256        ; screen width
LDI r2, 32         ; bar spacing

draw_loop:
  LDI r4, 0        ; x = 0
  draw_row:
    PSET r4, r15, r14
    ADD r4, r9     ; x++
    CMP r4, r13
    BLT r11, draw_row
  ADD r15, r9       ; y++
  CMP r15, r2
  BLT r11, draw_loop

; ── Get checksum before (op=1) ──
LDI r5, 1
AI_AGENT r5       ; r11 = checksum
MOV r1, r11        ; save in r1

; ── Modify screen -- blue square ──
LDI r14, 0x0000FF   ; blue
LDI r15, 100
LDI r2, 156

fill_y:
  LDI r4, 100
  fill_x:
    PSET r4, r15, r14
    ADD r4, r9
    CMP r4, r2
    BLT r11, fill_x
  ADD r15, r9
  CMP r15, r2
  BLT r11, fill_y

; ── Get checksum after (op=1) ──
LDI r5, 1
AI_AGENT r5       ; r11 = new checksum
MOV r12, r11        ; save in r12

; ── Vision API call with mock (op=3) ──
; Write prompt string "desc" to RAM at 0x5000
LDI r7, 0x5000
LDI r5, 0x64      ; 'd'
STORE r7, r5
LDI r6, 0x65      ; 'e'
MOV r5, r7
ADD r5, r9
STORE r5, r6
LDI r6, 0x73      ; 's'
MOV r5, r7
ADD r5, r9
ADD r5, r9
STORE r5, r6
LDI r6, 0x63      ; 'c'
MOV r5, r7
ADD r5, r9
ADD r5, r9
ADD r5, r9
STORE r5, r6
MOV r5, r7
ADD r5, r9
ADD r5, r9
ADD r5, r9
ADD r5, r9
LDI r6, 0
STORE r5, r6

; Set up registers for vision API
LDI r5, 3         ; op=3 (vision API)
MOV r8, r7       ; prompt addr
LDI r1, 0x6000    ; response addr
LDI r12, 256       ; max response length
AI_AGENT r5       ; r11 = response length

HALT
