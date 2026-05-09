; DESCRIPTION: Places a red circle of radius 21 at center (136, 205).
; PLAN: r0=136(x), r1=205(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 205
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
