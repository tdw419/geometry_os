; DESCRIPTION: Creates a black rectangular region at (96, 68) spanning 73 by 89 pixels.
; PLAN: r0=96(x), r1=68(y), r2=73(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 68
LDI r2, 73
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
