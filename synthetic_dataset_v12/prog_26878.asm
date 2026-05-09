; DESCRIPTION: Creates a yellow rectangular region at (308, 78) spanning 99 by 69 pixels.
; PLAN: r0=308(x), r1=78(y), r2=99(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 78
LDI r2, 99
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
