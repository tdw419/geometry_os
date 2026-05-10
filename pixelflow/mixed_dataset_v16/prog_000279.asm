; DESCRIPTION: Draws a blue rectangle at (140, 65) with width 94 and height 21.
; PLAN: r0=140(x), r1=65(y), r2=94(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 65
LDI r2, 94
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
