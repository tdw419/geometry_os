; DESCRIPTION: Creates a white rectangular region at (444, 181) spanning 33 by 51 pixels.
; PLAN: r0=444(x), r1=181(y), r2=33(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 181
LDI r2, 33
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
