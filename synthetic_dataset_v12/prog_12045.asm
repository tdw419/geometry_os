; DESCRIPTION: Draws a orange rectangle at (136, 144) with width 65 and height 98.
; PLAN: r0=136(x), r1=144(y), r2=65(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 144
LDI r2, 65
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
