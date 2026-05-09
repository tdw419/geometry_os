; DESCRIPTION: Creates a black rectangular region at (437, 137) spanning 14 by 21 pixels.
; PLAN: r0=437(x), r1=137(y), r2=14(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 137
LDI r2, 14
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
