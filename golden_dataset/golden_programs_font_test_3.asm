; DESCRIPTION: Display a object using color blue at the screen.

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
LOAD R0 0x000033
FILL R0

; Select variable-width 8x8 font (mode=1)
LOAD R0 1
FONT_SELECT R0

; Title: "8x8 FONT TEST" at (80, 10)
LOAD R0 80
LOAD R1 10
LOAD R2 title
TEXT R0 R1 R2

; Line 2: "ABCDEFGHIJ" at (16, 30)
LOAD R0 16
LOAD R1 30
LOAD R2 upper
TEXT R0 R1 R2

; Line 3: "abcdefghij" at (16, 42)
LOAD R0 16
LOAD R1 42
LOAD R2 lower
TEXT R0 R1 R2

; Line 4: "0123456789" at (16, 54)
LOAD R0 16
LOAD R1 54
LOAD R2 digits
TEXT R0 R1 R2

; Line 5: "!@#$%^&*()" at (16, 66)
LOAD R0 16
LOAD R1 66
LOAD R2 special
TEXT R0 R1 R2

; Draw horizontal separator lines using PSET loop
; Line at y=24
LOAD R0 0
LOAD R1 24
LOAD R2 0
hline1: CMP R2 256
       JMP GE done1
       PSET R0 R1 0xFFFFFF
       INC R0
       INC R2
       JMP hline1
done1:

; Line at y=78
LOAD R0 0
LOAD R1 78
LOAD R2 0
hline2: CMP R2 256
       JMP GE done2
       PSET R0 R1 0xFFFFFF
       INC R0
       INC R2
       JMP hline2
done2:

; Footer: "Phase 218 OK" at (60, 90)
LOAD R0 60
LOAD R1 90
LOAD R2 footer
TEXT R0 R1 R2

HALT

; Data section
title:   .string "8x8 FONT TEST"
upper:   .string "ABCDEFGHIJ"
lower:   .string "abcdefghij"
digits:  .string "0123456789"
special: .string "!@#$%%^&*()"
footer:  .string "Phase 218 OK"
