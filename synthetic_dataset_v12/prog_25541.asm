; DESCRIPTION: Draws a magenta rectangle at (198, 104) with width 108 and height 90.
; PLAN: r0=198(x), r1=104(y), r2=108(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 104
LDI r2, 108
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
