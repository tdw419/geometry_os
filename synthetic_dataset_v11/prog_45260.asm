; DESCRIPTION: Renders a green disk with center (25, 134) and radius 19.
; PLAN: r0=25(x), r1=134(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 134
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
