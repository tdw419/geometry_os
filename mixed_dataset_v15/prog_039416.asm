; DESCRIPTION: Creates a yellow rectangular region at (266, 44) spanning 102 by 106 pixels.
; PLAN: r0=266(x), r1=44(y), r2=102(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 44
LDI r2, 102
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
