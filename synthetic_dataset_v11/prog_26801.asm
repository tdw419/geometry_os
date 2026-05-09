; DESCRIPTION: Creates a black rectangular region at (138, 153) spanning 87 by 101 pixels.
; PLAN: r0=138(x), r1=153(y), r2=87(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 153
LDI r2, 87
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
