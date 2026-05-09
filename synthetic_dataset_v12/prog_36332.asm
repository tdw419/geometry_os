; DESCRIPTION: Draws a purple rectangle at (198, 3) with width 27 and height 118.
; PLAN: r0=198(x), r1=3(y), r2=27(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 3
LDI r2, 27
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
