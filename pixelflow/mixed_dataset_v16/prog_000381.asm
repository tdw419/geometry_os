; DESCRIPTION: Creates a black rectangular region at (119, 179) spanning 63 by 10 pixels.
; PLAN: r0=119(x), r1=179(y), r2=63(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 179
LDI r2, 63
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
