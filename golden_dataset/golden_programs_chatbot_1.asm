; DESCRIPTION: This GeOS assembly code reads a pattern code from RAM[0x7000], dispatches to corresponding pre-stored assembly programs for different patterns (SUN, RAIN, STAR, or default SMILEY), copies the selected program to the canvas buffer at 0x8000, clears any remaining buffer cells, self-assembles and runs the copied program, which then drives pixel drawing commands on the display.

; chatbot.asm - Pattern-Responsive Art Generator
; Self-modification showcase demo
;
; Reads pattern code from RAM[0x7000], copies pre-stored assembly
; text to the canvas buffer, then self-assembles and runs it.
; The generated code IS the art -- pixels driving pixels.
;
; Pattern codes (set RAM[0x7000] before running):
;   1 = SUN   (yellow cross)
;   2 = RAIN  (blue scattered drops)
;   3 = STAR  (white starburst)
;   0/default = SMILEY (green smiley face)

LDI r30, 0xFF00
LDI r2, 1

; Read pattern code from RAM[0x7000]
LDI r12, 0x7000
LOAD r12, r12

; Dispatch on pattern code
LDI r16, 1
CMP r12, r16
JZ r11, pick_sun

LDI r16, 2
CMP r12, r16
JZ r11, pick_rain

LDI r16, 3
CMP r12, r16
JZ r11, pick_star

; Default -- smiley
LDI r9, smiley_text
JMP do_copy

pick_sun:
  LDI r9, sun_text
  JMP do_copy

pick_rain:
  LDI r9, rain_text
  JMP do_copy

pick_star:
  LDI r9, star_text

do_copy:
  ; Copy selected pattern to canvas buffer at 0x8000
  ; Stop at 0xFF end marker
  LDI r10, 0x8000
  LDI r7, 0xFF

copy_loop:
  LOAD r1, r9
  CMP r1, r7
  JZ r11, copy_done
  STORE r10, r1
  ADD r9, r2
  ADD r10, r2
  JMP copy_loop

copy_done:
  ; Clear remaining canvas cells
  LDI r1, 0
  LDI r12, 0x9000

clear_loop:
  CMP r10, r12
  BGE r11, all_done
  STORE r10, r1
  ADD r10, r2
  JMP clear_loop

all_done:
  ASMSELF
  RUNNEXT

; ── Pre-stored assembly programs (data section) ──

sun_text:
  .asciz "PSETI 128,108,0xFFFF00"
  .byte 10
  .asciz "PSETI 128,128,0xFFFF00"
  .byte 10
  .asciz "PSETI 128,148,0xFFFF00"
  .byte 10
  .asciz "PSETI 108,128,0xFFFF00"
  .byte 10
  .asciz "PSETI 148,128,0xFFFF00"
  .byte 10
  .asciz "HALT"
  .byte 10
  .byte 0xFF

rain_text:
  .asciz "PSETI 64,80,0x4444FF"
  .byte 10
  .asciz "PSETI 96,120,0x4444FF"
  .byte 10
  .asciz "PSETI 128,60,0x4444FF"
  .byte 10
  .asciz "PSETI 160,140,0x4444FF"
  .byte 10
  .asciz "PSETI 80,180,0x4444FF"
  .byte 10
  .asciz "HALT"
  .byte 10
  .byte 0xFF

star_text:
  .asciz "PSETI 128,100,0xFFFFFF"
  .byte 10
  .asciz "PSETI 108,120,0xFFFFFF"
  .byte 10
  .asciz "PSETI 148,120,0xFFFFFF"
  .byte 10
  .asciz "PSETI 112,140,0xFFFFFF"
  .byte 10
  .asciz "PSETI 144,140,0xFFFFFF"
  .byte 10
  .asciz "HALT"
  .byte 10
  .byte 0xFF

smiley_text:
  .asciz "PSETI 112,112,0x00FF00"
  .byte 10
  .asciz "PSETI 144,112,0x00FF00"
  .byte 10
  .asciz "PSETI 108,128,0x00FF00"
  .byte 10
  .asciz "PSETI 128,140,0x00FF00"
  .byte 10
  .asciz "PSETI 148,128,0x00FF00"
  .byte 10
  .asciz "HALT"
  .byte 10
  .byte 0xFF
