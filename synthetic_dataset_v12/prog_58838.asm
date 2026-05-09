; DESCRIPTION: Creates a yellow rectangular region at (12, 25) spanning 58 by 119 pixels.
; PLAN: r0=12(x), r1=25(y), r2=58(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 25
LDI r2, 58
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
