; DESCRIPTION: Creates a yellow rectangular region at (51, 134) spanning 101 by 118 pixels.
; PLAN: r0=51(x), r1=134(y), r2=101(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 134
LDI r2, 101
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
