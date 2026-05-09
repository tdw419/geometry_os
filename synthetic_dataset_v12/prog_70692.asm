; DESCRIPTION: Draws a blue rectangle at (276, 39) with width 81 and height 73.
; PLAN: r0=276(x), r1=39(y), r2=81(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 39
LDI r2, 81
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
