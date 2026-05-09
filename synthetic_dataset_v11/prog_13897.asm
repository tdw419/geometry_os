; DESCRIPTION: Creates a yellow rectangular region at (185, 78) spanning 55 by 73 pixels.
; PLAN: r0=185(x), r1=78(y), r2=55(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 78
LDI r2, 55
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
