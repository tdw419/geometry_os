; DESCRIPTION: Creates a yellow rectangular region at (89, 49) spanning 92 by 120 pixels.
; PLAN: r0=89(x), r1=49(y), r2=92(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 49
LDI r2, 92
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
