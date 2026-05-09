; DESCRIPTION: Draws a purple rectangle at (127, 23) with width 40 and height 52.
; PLAN: r0=127(x), r1=23(y), r2=40(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 23
LDI r2, 40
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
