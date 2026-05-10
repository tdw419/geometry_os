; DESCRIPTION: Draws a purple rectangle at (387, 52) with width 27 and height 97.
; PLAN: r0=387(x), r1=52(y), r2=27(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 52
LDI r2, 27
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
