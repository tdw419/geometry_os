; DESCRIPTION: Creates a yellow rectangular region at (131, 69) spanning 22 by 89 pixels.
; PLAN: r0=131(x), r1=69(y), r2=22(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 69
LDI r2, 22
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
