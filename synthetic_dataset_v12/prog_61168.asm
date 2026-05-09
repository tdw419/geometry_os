; DESCRIPTION: Creates a yellow rectangular region at (287, 91) spanning 101 by 34 pixels.
; PLAN: r0=287(x), r1=91(y), r2=101(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 91
LDI r2, 101
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
