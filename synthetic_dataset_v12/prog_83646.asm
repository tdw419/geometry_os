; DESCRIPTION: Draws a orange rectangle at (290, 45) with width 30 and height 99.
; PLAN: r0=290(x), r1=45(y), r2=30(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 45
LDI r2, 30
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
