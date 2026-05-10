; DESCRIPTION: Draws a purple rectangle at (61, 57) with width 95 and height 18.
; PLAN: r0=61(x), r1=57(y), r2=95(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 57
LDI r2, 95
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
