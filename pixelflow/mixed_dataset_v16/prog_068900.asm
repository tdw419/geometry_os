; DESCRIPTION: Creates a yellow rectangular region at (395, 29) spanning 89 by 69 pixels.
; PLAN: r0=395(x), r1=29(y), r2=89(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 29
LDI r2, 89
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
