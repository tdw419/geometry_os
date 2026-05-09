; DESCRIPTION: Creates a black rectangular region at (181, 123) spanning 64 by 36 pixels.
; PLAN: r0=181(x), r1=123(y), r2=64(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 123
LDI r2, 64
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
