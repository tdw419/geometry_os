; DESCRIPTION: Creates a yellow rectangular region at (147, 161) spanning 86 by 23 pixels.
; PLAN: r0=147(x), r1=161(y), r2=86(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 161
LDI r2, 86
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
