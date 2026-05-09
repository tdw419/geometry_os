; DESCRIPTION: Creates a black rectangular region at (399, 112) spanning 25 by 43 pixels.
; PLAN: r0=399(x), r1=112(y), r2=25(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 112
LDI r2, 25
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
