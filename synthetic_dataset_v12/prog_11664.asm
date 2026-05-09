; DESCRIPTION: Creates a yellow rectangular region at (180, 156) spanning 119 by 58 pixels.
; PLAN: r0=180(x), r1=156(y), r2=119(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 156
LDI r2, 119
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
