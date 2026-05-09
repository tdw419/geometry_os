; DESCRIPTION: Renders a green disk with center (165, 157) and radius 65.
; PLAN: r0=165(x), r1=157(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 157
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
