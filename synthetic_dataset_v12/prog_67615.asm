; DESCRIPTION: Creates a green rectangular region at (357, 85) spanning 83 by 111 pixels.
; PLAN: r0=357(x), r1=85(y), r2=83(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 85
LDI r2, 83
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
