; DESCRIPTION: Creates a black rectangular region at (334, 73) spanning 58 by 99 pixels.
; PLAN: r0=334(x), r1=73(y), r2=58(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 73
LDI r2, 58
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
