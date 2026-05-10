; DESCRIPTION: Renders a green disk with center (342, 54) and radius 37.
; PLAN: r0=342(x), r1=54(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 54
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
