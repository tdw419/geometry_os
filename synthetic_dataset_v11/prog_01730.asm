; DESCRIPTION: Creates a black rectangular region at (115, 35) spanning 20 by 112 pixels.
; PLAN: r0=115(x), r1=35(y), r2=20(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 35
LDI r2, 20
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
