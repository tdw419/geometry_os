; DESCRIPTION: Creates a yellow rectangular region at (20, 147) spanning 28 by 86 pixels.
; PLAN: r0=20(x), r1=147(y), r2=28(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 147
LDI r2, 28
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
