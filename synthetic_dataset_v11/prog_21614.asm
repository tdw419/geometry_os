; DESCRIPTION: Creates a black rectangular region at (149, 31) spanning 87 by 81 pixels.
; PLAN: r0=149(x), r1=31(y), r2=87(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 31
LDI r2, 87
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
