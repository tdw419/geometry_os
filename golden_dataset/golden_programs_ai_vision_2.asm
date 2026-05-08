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
LDI r4, 1
LDI r8, 0xFF0000   ; red
LDI r14, 0          ; y = 0
LDI r12, 256        ; screen width
LDI r9, 32         ; bar spacing

draw_loop:
  LDI r0, 0        ; x = 0
  draw_row:
    PSET r0, r14, r8
    ADD r0, r4     ; x++
    CMP r0, r12
    BLT r13, draw_row
  ADD r14, r4       ; y++
  CMP r14, r9
  BLT r13, draw_loop

; ── Get checksum before (op=1) ──
LDI r2, 1
AI_AGENT r2       ; r13 = checksum
MOV r3, r13        ; save in r3

; ── Modify screen -- blue square ──
LDI r8, 0x0000FF   ; blue
LDI r14, 100
LDI r9, 156

fill_y:
  LDI r0, 100
  fill_x:
    PSET r0, r14, r8
    ADD r0, r4
    CMP r0, r9
    BLT r13, fill_x
  ADD r14, r4
  CMP r14, r9
  BLT r13, fill_y

; ── Get checksum after (op=1) ──
LDI r2, 1
AI_AGENT r2       ; r13 = new checksum
MOV r15, r13        ; save in r15

; ── Vision API call with mock (op=3) ──
; Write prompt string "desc" to RAM at 0x5000
LDI r7, 0x5000
LDI r2, 0x64      ; 'd'
STORE r7, r2
LDI r5, 0x65      ; 'e'
MOV r2, r7
ADD r2, r4
STORE r2, r5
LDI r5, 0x73      ; 's'
MOV r2, r7
ADD r2, r4
ADD r2, r4
STORE r2, r5
LDI r5, 0x63      ; 'c'
MOV r2, r7
ADD r2, r4
ADD r2, r4
ADD r2, r4
STORE r2, r5
MOV r2, r7
ADD r2, r4
ADD r2, r4
ADD r2, r4
ADD r2, r4
LDI r5, 0
STORE r2, r5

; Set up registers for vision API
LDI r2, 3         ; op=3 (vision API)
MOV r11, r7       ; prompt addr
LDI r3, 0x6000    ; response addr
LDI r15, 256       ; max response length
AI_AGENT r2       ; r13 = response length

HALT
