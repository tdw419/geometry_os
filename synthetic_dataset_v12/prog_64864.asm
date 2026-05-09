; DESCRIPTION: Draws a white rectangle at (22, 93) with width 96 and height 77.
; PLAN: r0=22(x), r1=93(y), r2=96(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 93
LDI r2, 96
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
