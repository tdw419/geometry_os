; sprite_anim.asm -- Phase 272: Sprite Animation Engine Demo
; Demonstrates manual sprite sheet parsing and multi-frame animation logic.
;
; RAM Layout:
;   0x4000-0x4FFF: Sprite Sheet (4 frames, 8x8 each, 4x64 = 256 pixels)
;   0x5000: Current frame index
;   0x5001: Frame counter (delay)

LDI r30, 0xFD00   ; Stack pointer
LDI r7, 1         ; Constant 1
LDI r9, 256       ; Screen width

; --- Part 1: Generate procedural sprite sheet at 0x4000 ---
; 4 frames of an 8x8 "character"
CALL generate_sheet

; --- Part 2: Main Animation Loop ---
LDI r5, 10        ; Current X
LDI r6, 120       ; Current Y
LDI r8, 0         ; Current frame

anim_loop:
  ; Clear background (black)
  LDI r1, 0
  FILL r1

  ; Draw the current frame
  MOV r1, r8
  SHLI r1, 6       ; r1 = frame * 64 (8x8 offset)
  LDI r2, 0x4000
  ADD r1, r2      ; r1 = start of frame in RAM
  
  MOV r2, r5      ; x
  MOV r3, r6      ; y
  LDI r4, 8       ; w
  LDI r10, 8      ; h
  SPRITE r2, r3, r1, r4, r10

  ; Advance frame every 10 ticks
  LDI r10, 0x5001
  LOAD r11, r10
  ADDI r11, 1
  STORE r10, r11
  
  CMPI r11, 5
  BLT r0, skip_frame
  
  LDI r11, 0
  STORE r10, r11
  ADDI r8, 1
  CMPI r8, 4
  BLT r0, skip_frame
  LDI r8, 0
  
skip_frame:
  ; Move character right by 2 pixels per frame
  ADDI r5, 2

  ; Wrap around screen edge
  CMPI r5, 256
  BLT r0, anim_wait
  LDI r5, 0

anim_wait:
  ; Wait ~50ms between frames (20 fps)
  LDI r10, 50
  TMR_WAIT r10

  ; Check for ESC key to exit
  IKEY r11
  CMPI r11, 27
  JZ r0, exit
  JMP anim_loop

exit:
  HALT

; --- Subroutines ---

generate_sheet:
  ; Frame 0: Red Box
  LDI r1, 0x4000
  LDI r2, 64
  LDI r3, 0xFF0000
  CALL fill_ram
  
  ; Frame 1: Green Box
  LDI r1, 0x4040
  LDI r2, 64
  LDI r3, 0x00FF00
  CALL fill_ram
  
  ; Frame 2: Blue Box
  LDI r1, 0x4080
  LDI r2, 64
  LDI r3, 0x0000FF
  CALL fill_ram
  
  ; Frame 3: White Cross
  LDI r1, 0x40C0
  LDI r2, 64
  LDI r3, 0
  CALL fill_ram    ; clear
  
  LDI r1, 0x40C0
  LDI r2, 8
  LDI r3, 0xFFFFFF
  CALL fill_ram    ; horizontal line
  
  LDI r1, 0x40C3   ; col 3
  LDI r2, 8
  LDI r3, 0xFFFFFF
  CALL fill_col8
  
  RET

; =============================================
; fill_ram: Fill N contiguous u32 pixels in RAM
; r1 = start address, r2 = count, r3 = color
; =============================================
fill_ram:
  CMPI r2, 0
  JZ r0, fill_done
  STORE r1, r3
  ADDI r1, 1
  SUBI r2, 1
  JMP fill_ram
fill_done:
  RET

; =============================================
; fill_col8: Fill 8 pixels at stride 8 (vertical column)
; r1 = start address, r2 = count (should be 8), r3 = color
; =============================================
fill_col8:
  CMPI r2, 0
  JZ r0, col_done
  STORE r1, r3
  ADDI r1, 8           ; stride = frame width
  SUBI r2, 1
  JMP fill_col8
col_done:
  RET
