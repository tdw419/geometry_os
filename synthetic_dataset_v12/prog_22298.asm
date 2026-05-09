; DESCRIPTION: Draws a purple rectangle at (404, 94) with width 108 and height 56.
; PLAN: r0=404(x), r1=94(y), r2=108(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 94
LDI r2, 108
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
