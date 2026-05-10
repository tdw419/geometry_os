; DESCRIPTION: Renders a green rectangular region spanning 62 by 78 at (83, 48).
; PLAN: r0=83(x), r1=48(y), r2=62(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 48
LDI r2, 62
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
