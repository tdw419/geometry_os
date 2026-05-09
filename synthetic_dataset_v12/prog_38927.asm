; DESCRIPTION: Draws a orange rectangle at (208, 130) with width 97 and height 98.
; PLAN: r0=208(x), r1=130(y), r2=97(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 130
LDI r2, 97
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
