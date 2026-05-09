; DESCRIPTION: Creates a yellow rectangular region at (6, 189) spanning 119 by 37 pixels.
; PLAN: r0=6(x), r1=189(y), r2=119(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 189
LDI r2, 119
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
