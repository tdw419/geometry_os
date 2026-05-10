; DESCRIPTION: Renders a yellow disk with center (391, 91) and radius 75.
; PLAN: r0=391(x), r1=91(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 91
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
