; DESCRIPTION: Draws a white rectangle at (56, 29) with width 118 and height 93.
; PLAN: r0=56(x), r1=29(y), r2=118(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 29
LDI r2, 118
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
