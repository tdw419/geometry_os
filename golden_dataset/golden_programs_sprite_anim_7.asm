; DESCRIPTION: Geometry OS program to draw a colored object.

; sprite_anim.asm -- Animated sprite walk cycle demo
; Demonstrates SPRITEANIM opcode (0xEC): auto-advancing sprite animation
;
; A 4-frame walk cycle (8x8 per frame) walks a character across the screen.
; Each frame is a distinct color pattern representing a walk pose.
; SPRITEANIM handles frame advancement automatically -- no manual
; SPRFRAME + ADD + MOD sequence needed.
;
; Comparison:
;   Old way: SPRFRAME + SPRANIM + ADD + MOD = 4 instructions
;   New way: SPRITEANIM = 1 instruction
;
; Design: visual state encoded as spatial patterns (position, region)
; for deterministic vision-gate verification. No color-channel state encoding.

; -- Constants --
LDI r11, 1              ; increment
LDI r0, 8              ; sprite size (8x8)
LDI r4, 248            ; screen wrap limit (256 - 8)
LDI r10, 0xFF0000      ; red
LDI r13, 0xFF8800      ; orange
LDI r16, 0xFFFF00      ; yellow
LDI r17, 0x00FF00      ; green

; -- Build 4-frame sprite sheet at 0x3000 using inline RAM writes --
; Frame 0 at 0x3000: red filled square (standing)
; Frame 1 at 0x3040: orange L-shape (left step)
; Frame 2 at 0x3080: yellow cross (mid-stride)
; Frame 3 at 0x30C0: green reversed-L (right step)
CALL build_sprites

; -- Register sprite sheet with SPRLOAD --
LDI r1, 0x3000         ; base address
LDI r8, 8              ; frame width
LDI r2, 8              ; frame height
LDI r9, 4              ; total frames
SPRLOAD 0, r1, r8, r2, r9

; -- Initialize character position --
LDI r6, 10             ; x position
LDI r5, 124            ; y position (center of screen)

; -- Main animation loop --
anim_loop:
  ; Clear previous sprite area (black = transparent area erased)
  FILL r5, r6, r0, r0, 0

  ; SPRITEANIM: blit current frame, auto-advance frame counter
  SPRITEANIM 0, r6, r5

  ; Move character right by 2 pixels per frame
  ADD r6, r11
  ADD r6, r11

  ; Wrap around screen edge
  CMP r6, r4
  JLT anim_wait
  LDI r6, 0

anim_wait:
  ; Wait ~50ms between frames (20 fps)
  LDI r3, 50
  TMR_WAIT r3

  ; Check for ESC key to exit
  IKEY r7
  CMP r7, 27
  JZ exit
  JMP anim_loop

exit:
  HALT

; =============================================
; build_sprites: Build 4 walk cycle frames
; =============================================
; Uses a helper to fill rectangular pixel regions in RAM.
; Each frame is 8x8 = 64 u32 pixels.
; Total: 256 pixels at 0x3000-0x30FF.

build_sprites:
  PUSH r1
  PUSH r8
  PUSH r2

  ; -- Frame 0 (0x3000): Red filled square --
  ; Simple filled rectangle = standing pose
  LDI r1, 0x3000       ; dest addr
  LDI r8, 64           ; pixel count
  LDI r2, 0xFF0000     ; red
  CALL fill_ram

  ; -- Frame 1 (0x3040): Orange L-shape --
  ; Clear first
  LDI r1, 0x3040
  LDI r8, 64
  LDI r2, 0            ; transparent
  CALL fill_ram
  ; Left column: 8 pixels at rows 0-7, column 0
  LDI r1, 0x3040
  LDI r8, 8
  LDI r2, 0xFF8800
  CALL fill_col8
  ; Bottom row: 8 pixels at row 7
  LDI r1, 0x3078
  LDI r8, 8
  LDI r2, 0xFF8800
  CALL fill_ram

  ; -- Frame 2 (0x3080): Yellow horizontal bar --
  ; Clear first
  LDI r1, 0x3080
  LDI r8, 64
  LDI r2, 0
  CALL fill_ram
  ; Middle rows (3,4) fully filled
  LDI r1, 0x3098       ; row 3
  LDI r8, 16           ; 2 rows * 8 pixels
  LDI r2, 0xFFFF00
  CALL fill_ram
  ; Vertical bar in middle column
  LDI r1, 0x3083       ; col 3, row 0
  LDI r8, 8            ; 8 rows, 8 apart
  LDI r2, 0xFFFF00
  CALL fill_col8
  ; Also col 4
  LDI r1, 0x3084
  LDI r8, 8
  LDI r2, 0xFFFF00
  CALL fill_col8

  ; -- Frame 3 (0x30C0): Green reversed-L --
  ; Clear first
  LDI r1, 0x30C0
  LDI r8, 64
  LDI r2, 0
  CALL fill_ram
  ; Right column: 8 pixels at column 7
  LDI r1, 0x30C7
  LDI r8, 8
  LDI r2, 0x00FF00
  CALL fill_col8
  ; Bottom row
  LDI r1, 0x30F8
  LDI r8, 8
  LDI r2, 0x00FF00
  CALL fill_ram

  POP r2
  POP r8
  POP r1
  RET

; =============================================
; fill_ram: Fill N contiguous u32 pixels in RAM
; r1 = start address, r8 = count, r2 = color
; =============================================
fill_ram:
  CMP r8, 0
  JZ fill_done
  STORE r1, r2
  ADD r1, r11
  SUB r8, r11
  JMP fill_ram
fill_done:
  RET

; =============================================
; fill_col8: Fill 8 pixels at stride 8 (vertical column)
; r1 = start address, r8 = count (should be 8), r2 = color
; =============================================
fill_col8:
  CMP r8, 0
  JZ col_done
  STORE r1, r2
  ADD r1, 8           ; stride = frame width
  SUB r8, r11
  JMP fill_col8
col_done:
  RET
