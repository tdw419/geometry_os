; DESCRIPTION: Draws a blue rectangle at (185, 108) with width 94 and height 82.
; PLAN: r0=185(x), r1=108(y), r2=94(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 108
LDI r2, 94
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
