; DESCRIPTION: Geometry OS program to draw a red square.

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
LDI r11, 0xFF0000   ; red
LDI r0, 0          ; y = 0
LDI r7, 256        ; screen width
LDI r14, 32         ; bar spacing

draw_loop:
  LDI r5, 0        ; x = 0
  draw_row:
    PSET r5, r0, r11
    ADD r5, r9     ; x++
    CMP r5, r7
    BLT r15, draw_row
  ADD r0, r9       ; y++
  CMP r0, r14
  BLT r15, draw_loop

; ── Get checksum before (op=1) ──
LDI r12, 1
AI_AGENT r12       ; r15 = checksum
MOV r6, r15        ; save in r6

; ── Modify screen -- blue square ──
LDI r11, 0x0000FF   ; blue
LDI r0, 100
LDI r14, 156

fill_y:
  LDI r5, 100
  fill_x:
    PSET r5, r0, r11
    ADD r5, r9
    CMP r5, r14
    BLT r15, fill_x
  ADD r0, r9
  CMP r0, r14
  BLT r15, fill_y

; ── Get checksum after (op=1) ──
LDI r12, 1
AI_AGENT r12       ; r15 = new checksum
MOV r2, r15        ; save in r2

; ── Vision API call with mock (op=3) ──
; Write prompt string "desc" to RAM at 0x5000
LDI r1, 0x5000
LDI r12, 0x64      ; 'd'
STORE r1, r12
LDI r13, 0x65      ; 'e'
MOV r12, r1
ADD r12, r9
STORE r12, r13
LDI r13, 0x73      ; 's'
MOV r12, r1
ADD r12, r9
ADD r12, r9
STORE r12, r13
LDI r13, 0x63      ; 'c'
MOV r12, r1
ADD r12, r9
ADD r12, r9
ADD r12, r9
STORE r12, r13
MOV r12, r1
ADD r12, r9
ADD r12, r9
ADD r12, r9
ADD r12, r9
LDI r13, 0
STORE r12, r13

; Set up registers for vision API
LDI r12, 3         ; op=3 (vision API)
MOV r3, r1       ; prompt addr
LDI r6, 0x6000    ; response addr
LDI r2, 256       ; max response length
AI_AGENT r12       ; r15 = response length

HALT
