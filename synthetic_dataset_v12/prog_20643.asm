; DESCRIPTION: Creates a yellow rectangular region at (334, 147) spanning 17 by 21 pixels.
; PLAN: r0=334(x), r1=147(y), r2=17(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 147
LDI r2, 17
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
