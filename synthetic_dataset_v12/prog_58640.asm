; DESCRIPTION: Creates a yellow rectangular region at (355, 56) spanning 20 by 94 pixels.
; PLAN: r0=355(x), r1=56(y), r2=20(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 56
LDI r2, 20
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
