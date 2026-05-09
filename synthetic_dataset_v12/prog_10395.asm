; DESCRIPTION: Creates a green rectangular region at (31, 1) spanning 56 by 92 pixels.
; PLAN: r0=31(x), r1=1(y), r2=56(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 1
LDI r2, 56
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
