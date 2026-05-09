; DESCRIPTION: Renders a red disk with center (130, 86) and radius 23.
; PLAN: r0=130(x), r1=86(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 86
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
