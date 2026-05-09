; DESCRIPTION: Creates a black rectangular region at (45, 17) spanning 110 by 110 pixels.
; PLAN: r0=45(x), r1=17(y), r2=110(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 17
LDI r2, 110
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
