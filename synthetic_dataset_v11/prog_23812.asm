; DESCRIPTION: Creates a white rectangular region at (51, 100) spanning 23 by 119 pixels.
; PLAN: r0=51(x), r1=100(y), r2=23(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 100
LDI r2, 23
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
