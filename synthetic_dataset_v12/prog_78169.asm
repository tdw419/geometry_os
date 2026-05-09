; DESCRIPTION: Creates a yellow rectangular region at (436, 123) spanning 55 by 38 pixels.
; PLAN: r0=436(x), r1=123(y), r2=55(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 123
LDI r2, 55
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
