; DESCRIPTION: Renders a white box of size 118x96 starting at (84, 1).
; PLAN: r0=84(x), r1=1(y), r2=118(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 1
LDI r2, 118
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
