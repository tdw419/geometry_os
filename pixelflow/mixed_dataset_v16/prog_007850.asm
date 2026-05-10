; DESCRIPTION: Renders a white box of size 73x78 starting at (83, 160).
; PLAN: r0=83(x), r1=160(y), r2=73(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 160
LDI r2, 73
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
