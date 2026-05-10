; DESCRIPTION: Creates a black rectangular region at (30, 100) spanning 14 by 55 pixels.
; PLAN: r0=30(x), r1=100(y), r2=14(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 100
LDI r2, 14
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
