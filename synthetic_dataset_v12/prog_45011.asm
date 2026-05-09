; DESCRIPTION: Creates a white rectangular region at (38, 56) spanning 114 by 51 pixels.
; PLAN: r0=38(x), r1=56(y), r2=114(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 56
LDI r2, 114
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
