; DESCRIPTION: Creates a yellow rectangular region at (13, 156) spanning 83 by 77 pixels.
; PLAN: r0=13(x), r1=156(y), r2=83(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 156
LDI r2, 83
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
