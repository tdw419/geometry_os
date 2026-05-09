; DESCRIPTION: Creates a yellow rectangular region at (138, 49) spanning 64 by 106 pixels.
; PLAN: r0=138(x), r1=49(y), r2=64(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 49
LDI r2, 64
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
