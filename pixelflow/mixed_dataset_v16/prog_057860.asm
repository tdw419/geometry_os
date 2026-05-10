; DESCRIPTION: Renders a yellow disk with center (172, 195) and radius 40.
; PLAN: r0=172(x), r1=195(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 195
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
