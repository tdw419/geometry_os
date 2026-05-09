; DESCRIPTION: Creates a yellow rectangular region at (189, 83) spanning 40 by 92 pixels.
; PLAN: r0=189(x), r1=83(y), r2=40(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 83
LDI r2, 40
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
