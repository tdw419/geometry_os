; DESCRIPTION: Creates a yellow rectangular region at (99, 17) spanning 115 by 101 pixels.
; PLAN: r0=99(x), r1=17(y), r2=115(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 17
LDI r2, 115
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
