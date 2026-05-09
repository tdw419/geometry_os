; DESCRIPTION: Draws a blue rectangle at (4, 36) with width 73 and height 107.
; PLAN: r0=4(x), r1=36(y), r2=73(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 36
LDI r2, 73
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
