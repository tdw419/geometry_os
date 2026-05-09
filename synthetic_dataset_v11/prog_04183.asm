; DESCRIPTION: Creates a green rectangular region at (3, 36) spanning 92 by 31 pixels.
; PLAN: r0=3(x), r1=36(y), r2=92(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 36
LDI r2, 92
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
