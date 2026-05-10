; DESCRIPTION: Creates a black rectangular region at (227, 176) spanning 56 by 51 pixels.
; PLAN: r0=227(x), r1=176(y), r2=56(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 176
LDI r2, 56
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
