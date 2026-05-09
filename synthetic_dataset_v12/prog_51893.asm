; DESCRIPTION: Creates a black rectangular region at (22, 63) spanning 38 by 96 pixels.
; PLAN: r0=22(x), r1=63(y), r2=38(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 63
LDI r2, 38
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
