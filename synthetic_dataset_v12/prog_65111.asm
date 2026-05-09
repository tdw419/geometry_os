; DESCRIPTION: Creates a green rectangular region at (194, 3) spanning 92 by 56 pixels.
; PLAN: r0=194(x), r1=3(y), r2=92(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 3
LDI r2, 92
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
