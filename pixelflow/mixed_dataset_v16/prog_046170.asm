; DESCRIPTION: Renders a green rectangular region spanning 35 by 37 at (151, 199).
; PLAN: r0=151(x), r1=199(y), r2=35(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 199
LDI r2, 35
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
