; DESCRIPTION: Creates a black rectangular region at (308, 154) spanning 81 by 101 pixels.
; PLAN: r0=308(x), r1=154(y), r2=81(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 154
LDI r2, 81
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
