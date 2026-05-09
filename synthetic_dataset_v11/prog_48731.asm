; DESCRIPTION: Creates a purple rectangular region at (147, 88) spanning 99 by 27 pixels.
; PLAN: r0=147(x), r1=88(y), r2=99(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 88
LDI r2, 99
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
