; DESCRIPTION: Draws a purple rectangle at (445, 142) with width 61 and height 73.
; PLAN: r0=445(x), r1=142(y), r2=61(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 142
LDI r2, 61
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
