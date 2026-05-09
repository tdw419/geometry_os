; DESCRIPTION: Creates a black rectangular region at (30, 137) spanning 61 by 106 pixels.
; PLAN: r0=30(x), r1=137(y), r2=61(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 137
LDI r2, 61
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
