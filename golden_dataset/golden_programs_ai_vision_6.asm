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
LDI r7, 1
LDI r1, 0xFF0000   ; red
LDI r8, 0          ; y = 0
LDI r5, 256        ; screen width
LDI r0, 32         ; bar spacing

draw_loop:
  LDI r14, 0        ; x = 0
  draw_row:
    PSET r14, r8, r1
    ADD r14, r7     ; x++
    CMP r14, r5
    BLT r15, draw_row
  ADD r8, r7       ; y++
  CMP r8, r0
  BLT r15, draw_loop

; ── Get checksum before (op=1) ──
LDI r2, 1
AI_AGENT r2       ; r15 = checksum
MOV r11, r15        ; save in r11

; ── Modify screen -- blue square ──
LDI r1, 0x0000FF   ; blue
LDI r8, 100
LDI r0, 156

fill_y:
  LDI r14, 100
  fill_x:
    PSET r14, r8, r1
    ADD r14, r7
    CMP r14, r0
    BLT r15, fill_x
  ADD r8, r7
  CMP r8, r0
  BLT r15, fill_y

; ── Get checksum after (op=1) ──
LDI r2, 1
AI_AGENT r2       ; r15 = new checksum
MOV r12, r15        ; save in r12

; ── Vision API call with mock (op=3) ──
; Write prompt string "desc" to RAM at 0x5000
LDI r3, 0x5000
LDI r2, 0x64      ; 'd'
STORE r3, r2
LDI r13, 0x65      ; 'e'
MOV r2, r3
ADD r2, r7
STORE r2, r13
LDI r13, 0x73      ; 's'
MOV r2, r3
ADD r2, r7
ADD r2, r7
STORE r2, r13
LDI r13, 0x63      ; 'c'
MOV r2, r3
ADD r2, r7
ADD r2, r7
ADD r2, r7
STORE r2, r13
MOV r2, r3
ADD r2, r7
ADD r2, r7
ADD r2, r7
ADD r2, r7
LDI r13, 0
STORE r2, r13

; Set up registers for vision API
LDI r2, 3         ; op=3 (vision API)
MOV r6, r3       ; prompt addr
LDI r11, 0x6000    ; response addr
LDI r12, 256       ; max response length
AI_AGENT r2       ; r15 = response length

HALT
