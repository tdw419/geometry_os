; DESCRIPTION: Creates a yellow rectangular region at (179, 147) spanning 56 by 88 pixels.
; PLAN: r0=179(x), r1=147(y), r2=56(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 147
LDI r2, 56
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
