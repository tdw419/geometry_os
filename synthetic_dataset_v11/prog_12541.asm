; DESCRIPTION: Creates a yellow rectangular region at (51, 96) spanning 35 by 94 pixels.
; PLAN: r0=51(x), r1=96(y), r2=35(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 96
LDI r2, 35
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
