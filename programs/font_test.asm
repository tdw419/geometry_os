; font_test.asm -- Phase 218: Verify 8x8 font rendering capability
; Uses the pixel VM TEXT opcode with variable-width 8x8 font mode.
;
; This demo exercises the 8x8 VGA font (mode=1) via FONT_SELECT + TEXT opcodes.
; Expected visual output:
;   - Dark blue background (0x000033)
;   - Title "8x8 FONT TEST" centered at y=10
;   - Uppercase alphabet at y=30
;   - Lowercase alphabet at y=42
;   - Digits at y=54
;   - Footer "Phase 218 OK" at y=90

; Fill background dark blue
LDI r0, 0x000033
FILL r0

; Select variable-width 8x8 font (mode=1)
LDI r0, 1
FONT_SELECT r0

; Title: "8x8 FONT TEST" at (80, 10)
LDI r0, 80
LDI r1, 10
LDI r2, :title
TEXT r0, r1, r2

; Line 2: "ABCDEFGHIJ" at (16, 30)
LDI r0, 16
LDI r1, 30
LDI r2, :upper
TEXT r0, r1, r2

; Line 3: "abcdefghij" at (16, 42)
LDI r0, 16
LDI r1, 42
LDI r2, :lower
TEXT r0, r1, r2

; Line 4: "0123456789" at (16, 54)
LDI r0, 16
LDI r1, 54
LDI r2, :digits
TEXT r0, r1, r2

; Line 5: "!@#$%^&*()" at (16, 66)
LDI r0, 16
LDI r1, 66
LDI r2, :special
TEXT r0, r1, r2

; Draw horizontal separator lines using PSET loop
; Line at y=24
LDI r0, 0
LDI r1, 24
LDI r2, 0
:hline1
   CMP r2, r0
   PSET r2, r1, r0 ; color r0 (blue) - wait, should be white
   LDI r3, 0xFFFFFF
   PSET r2, r1, r3
   ADDI r2, 1
   CMPI r2, 256
   BLT r0, :hline1

; Line at y=78
LDI r0, 0
LDI r1, 78
LDI r2, 0
:hline2
   LDI r3, 0xFFFFFF
   PSET r2, r1, r3
   ADDI r2, 1
   CMPI r2, 256
   BLT r0, :hline2

; Footer: "Phase 218 OK" at (60, 90)
LDI r0, 60
LDI r1, 90
LDI r2, :footer
TEXT r0, r1, r2

HALT

:title .str "8x8 FONT TEST"
:upper .str "ABCDEFGHIJ"
:lower .str "abcdefghij"
:digits .str "0123456789"
:special .str "!@#$%^&*()"
:footer .str "Phase 218 OK"
