; DESCRIPTION: Draws a purple rectangle at (94, 59) with width 28 and height 80.
; PLAN: r0=94(x), r1=59(y), r2=28(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 59
LDI r2, 28
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
