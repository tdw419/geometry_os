; DESCRIPTION: Draws a orange rectangle at (290, 150) with width 84 and height 22.
; PLAN: r0=290(x), r1=150(y), r2=84(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 150
LDI r2, 84
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
