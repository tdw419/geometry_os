; DESCRIPTION: Creates a yellow rectangular region at (118, 156) spanning 105 by 48 pixels.
; PLAN: r0=118(x), r1=156(y), r2=105(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 156
LDI r2, 105
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
