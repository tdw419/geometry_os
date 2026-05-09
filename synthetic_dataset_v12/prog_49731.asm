; DESCRIPTION: Renders a purple disk with center (364, 91) and radius 75.
; PLAN: r0=364(x), r1=91(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 91
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
