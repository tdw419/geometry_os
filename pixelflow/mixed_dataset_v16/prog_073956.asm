; DESCRIPTION: Creates a red rectangular region at (137, 156) spanning 34 by 46 pixels.
; PLAN: r0=137(x), r1=156(y), r2=34(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 156
LDI r2, 34
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
