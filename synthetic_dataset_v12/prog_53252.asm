; DESCRIPTION: Creates a black rectangular region at (6, 100) spanning 110 by 46 pixels.
; PLAN: r0=6(x), r1=100(y), r2=110(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 100
LDI r2, 110
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
