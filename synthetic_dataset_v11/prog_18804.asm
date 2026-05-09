; DESCRIPTION: Creates a white rectangular region at (162, 177) spanning 88 by 51 pixels.
; PLAN: r0=162(x), r1=177(y), r2=88(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 177
LDI r2, 88
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
