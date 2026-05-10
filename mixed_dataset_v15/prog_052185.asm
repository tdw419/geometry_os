; DESCRIPTION: Creates a yellow rectangular region at (342, 123) spanning 100 by 54 pixels.
; PLAN: r0=342(x), r1=123(y), r2=100(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 123
LDI r2, 100
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
