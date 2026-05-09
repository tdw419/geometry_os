; DESCRIPTION: Draws a magenta rectangle at (15, 71) with width 104 and height 80.
; PLAN: r0=15(x), r1=71(y), r2=104(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 71
LDI r2, 104
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
