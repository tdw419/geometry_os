; DESCRIPTION: Creates a black rectangular region at (282, 189) spanning 35 by 22 pixels.
; PLAN: r0=282(x), r1=189(y), r2=35(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 189
LDI r2, 35
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
