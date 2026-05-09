; DESCRIPTION: Draws a magenta rectangle at (126, 52) with width 105 and height 104.
; PLAN: r0=126(x), r1=52(y), r2=105(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 52
LDI r2, 105
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
