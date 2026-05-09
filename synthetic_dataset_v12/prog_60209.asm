; DESCRIPTION: Creates a green rectangular region at (98, 10) spanning 92 by 88 pixels.
; PLAN: r0=98(x), r1=10(y), r2=92(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 10
LDI r2, 92
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
