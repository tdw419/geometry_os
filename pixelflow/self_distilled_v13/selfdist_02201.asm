; DESCRIPTION: Renders a green rectangular region spanning 19 by 99 at (120, 157).
; PLAN: r0=120(x), r1=157(y), r2=19(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 157
LDI r2, 19
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
