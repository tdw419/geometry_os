; DESCRIPTION: Creates a yellow rectangular region at (314, 169) spanning 75 by 65 pixels.
; PLAN: r0=314(x), r1=169(y), r2=75(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 169
LDI r2, 75
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
