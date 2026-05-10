; DESCRIPTION: Creates a yellow rectangular region at (22, 34) spanning 98 by 85 pixels.
; PLAN: r0=22(x), r1=34(y), r2=98(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 34
LDI r2, 98
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
