; DESCRIPTION: Creates a yellow rectangular region at (158, 72) spanning 37 by 33 pixels.
; PLAN: r0=158(x), r1=72(y), r2=37(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 72
LDI r2, 37
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
