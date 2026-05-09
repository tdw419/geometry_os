; DESCRIPTION: Draws a purple rectangle at (404, 106) with width 12 and height 88.
; PLAN: r0=404(x), r1=106(y), r2=12(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 106
LDI r2, 12
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
