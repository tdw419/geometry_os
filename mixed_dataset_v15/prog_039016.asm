; DESCRIPTION: Creates a yellow rectangular region at (155, 36) spanning 117 by 101 pixels.
; PLAN: r0=155(x), r1=36(y), r2=117(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 36
LDI r2, 117
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
