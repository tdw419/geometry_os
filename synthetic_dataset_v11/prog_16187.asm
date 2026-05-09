; DESCRIPTION: Creates a red rectangular region at (97, 137) spanning 106 by 71 pixels.
; PLAN: r0=97(x), r1=137(y), r2=106(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 137
LDI r2, 106
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
