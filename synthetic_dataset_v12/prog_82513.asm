; DESCRIPTION: Creates a red rectangular region at (106, 156) spanning 97 by 89 pixels.
; PLAN: r0=106(x), r1=156(y), r2=97(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 156
LDI r2, 97
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
