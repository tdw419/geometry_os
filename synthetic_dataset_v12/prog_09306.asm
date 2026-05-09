; DESCRIPTION: Renders a yellow disk with center (213, 195) and radius 35.
; PLAN: r0=213(x), r1=195(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 195
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
