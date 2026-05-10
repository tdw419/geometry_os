; DESCRIPTION: Renders a green rectangular region spanning 40 by 119 at (340, 60).
; PLAN: r0=340(x), r1=60(y), r2=40(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 60
LDI r2, 40
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
