; DESCRIPTION: Creates a yellow rectangular region at (314, 76) spanning 72 by 112 pixels.
; PLAN: r0=314(x), r1=76(y), r2=72(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 76
LDI r2, 72
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
