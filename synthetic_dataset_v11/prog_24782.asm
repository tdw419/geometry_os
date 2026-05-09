; DESCRIPTION: Creates a white rectangular region at (181, 49) spanning 51 by 84 pixels.
; PLAN: r0=181(x), r1=49(y), r2=51(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 49
LDI r2, 51
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
