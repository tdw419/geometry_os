; DESCRIPTION: Renders a blue box of size 40x66 starting at (335, 102).
; PLAN: r0=335(x), r1=102(y), r2=40(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 102
LDI r2, 40
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
