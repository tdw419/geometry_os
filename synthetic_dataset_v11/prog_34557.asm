; DESCRIPTION: Draws a magenta rectangle at (66, 222) with width 76 and height 30.
; PLAN: r0=66(x), r1=222(y), r2=76(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 222
LDI r2, 76
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
