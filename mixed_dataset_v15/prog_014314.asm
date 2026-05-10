; DESCRIPTION: Renders a yellow disk with center (61, 195) and radius 53.
; PLAN: r0=61(x), r1=195(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 195
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
