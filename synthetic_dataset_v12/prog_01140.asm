; DESCRIPTION: Draws a blue rectangle at (241, 77) with width 114 and height 93.
; PLAN: r0=241(x), r1=77(y), r2=114(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 77
LDI r2, 114
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
