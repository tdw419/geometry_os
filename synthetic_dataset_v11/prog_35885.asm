; DESCRIPTION: Renders a yellow disk with center (76, 197) and radius 39.
; PLAN: r0=76(x), r1=197(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 197
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
