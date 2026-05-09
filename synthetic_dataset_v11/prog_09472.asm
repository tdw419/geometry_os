; DESCRIPTION: Creates a yellow rectangular region at (61, 92) spanning 110 by 58 pixels.
; PLAN: r0=61(x), r1=92(y), r2=110(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 92
LDI r2, 110
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
