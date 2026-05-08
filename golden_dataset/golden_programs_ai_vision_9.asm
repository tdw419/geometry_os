; DESCRIPTION: The assembly code demonstrates the AI Vision Bridge functionality by drawing red bars on the screen, taking a checksum of the initial state, modifying the screen with a blue square, taking another checksum after modification, and making a mock call to the vision API with the prompt "desc". The program uses specific opcodes and registers to handle these tasks.

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
LDI r12, 1
LDI r11, 0xFF0000   ; red
LDI r3, 0          ; y = 0
LDI r5, 256        ; screen width
LDI r8, 32         ; bar spacing

draw_loop:
  LDI r13, 0        ; x = 0
  draw_row:
    PSET r13, r3, r11
    ADD r13, r12     ; x++
    CMP r13, r5
    BLT r6, draw_row
  ADD r3, r12       ; y++
  CMP r3, r8
  BLT r6, draw_loop

; ── Get checksum before (op=1) ──
LDI r2, 1
AI_AGENT r2       ; r6 = checksum
MOV r4, r6        ; save in r4

; ── Modify screen -- blue square ──
LDI r11, 0x0000FF   ; blue
LDI r3, 100
LDI r8, 156

fill_y:
  LDI r13, 100
  fill_x:
    PSET r13, r3, r11
    ADD r13, r12
    CMP r13, r8
    BLT r6, fill_x
  ADD r3, r12
  CMP r3, r8
  BLT r6, fill_y

; ── Get checksum after (op=1) ──
LDI r2, 1
AI_AGENT r2       ; r6 = new checksum
MOV r10, r6        ; save in r10

; ── Vision API call with mock (op=3) ──
; Write prompt string "desc" to RAM at 0x5000
LDI r7, 0x5000
LDI r2, 0x64      ; 'd'
STORE r7, r2
LDI r14, 0x65      ; 'e'
MOV r2, r7
ADD r2, r12
STORE r2, r14
LDI r14, 0x73      ; 's'
MOV r2, r7
ADD r2, r12
ADD r2, r12
STORE r2, r14
LDI r14, 0x63      ; 'c'
MOV r2, r7
ADD r2, r12
ADD r2, r12
ADD r2, r12
STORE r2, r14
MOV r2, r7
ADD r2, r12
ADD r2, r12
ADD r2, r12
ADD r2, r12
LDI r14, 0
STORE r2, r14

; Set up registers for vision API
LDI r2, 3         ; op=3 (vision API)
MOV r15, r7       ; prompt addr
LDI r4, 0x6000    ; response addr
LDI r10, 256       ; max response length
AI_AGENT r2       ; r6 = response length

HALT
