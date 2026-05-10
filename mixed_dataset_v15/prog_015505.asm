; DESCRIPTION: Creates a yellow rectangular region at (273, 102) spanning 36 by 106 pixels.
; PLAN: r0=273(x), r1=102(y), r2=36(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 102
LDI r2, 36
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
