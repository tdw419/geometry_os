; DESCRIPTION: Draws a white rectangle at (98, 73) with width 79 and height 118.
; PLAN: r0=98(x), r1=73(y), r2=79(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 73
LDI r2, 79
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
