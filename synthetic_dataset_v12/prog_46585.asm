; DESCRIPTION: Draws a purple rectangle at (387, 23) with width 94 and height 47.
; PLAN: r0=387(x), r1=23(y), r2=94(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 23
LDI r2, 94
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
