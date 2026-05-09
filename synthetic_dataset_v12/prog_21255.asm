; DESCRIPTION: Creates a yellow rectangular region at (12, 19) spanning 81 by 51 pixels.
; PLAN: r0=12(x), r1=19(y), r2=81(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 19
LDI r2, 81
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
