; DESCRIPTION: Draws a orange rectangle at (290, 87) with width 106 and height 47.
; PLAN: r0=290(x), r1=87(y), r2=106(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 87
LDI r2, 106
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
