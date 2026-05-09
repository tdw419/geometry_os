; DESCRIPTION: Creates a black rectangular region at (78, 137) spanning 32 by 32 pixels.
; PLAN: r0=78(x), r1=137(y), r2=32(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 137
LDI r2, 32
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
