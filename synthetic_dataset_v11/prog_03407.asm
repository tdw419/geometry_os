; DESCRIPTION: Creates a yellow rectangular region at (34, 100) spanning 107 by 72 pixels.
; PLAN: r0=34(x), r1=100(y), r2=107(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 100
LDI r2, 107
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
