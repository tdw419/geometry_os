; DESCRIPTION: Creates a green rectangular region at (160, 92) spanning 43 by 106 pixels.
; PLAN: r0=160(x), r1=92(y), r2=43(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 92
LDI r2, 43
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
