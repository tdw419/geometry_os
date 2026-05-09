; DESCRIPTION: Creates a black rectangular region at (64, 122) spanning 101 by 101 pixels.
; PLAN: r0=64(x), r1=122(y), r2=101(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 122
LDI r2, 101
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
