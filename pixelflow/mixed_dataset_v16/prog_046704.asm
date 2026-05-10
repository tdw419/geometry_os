; DESCRIPTION: Renders a green disk with center (210, 114) and radius 76.
; PLAN: r0=210(x), r1=114(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 114
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
