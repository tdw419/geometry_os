; DESCRIPTION: Renders a green disk with center (225, 49) and radius 27.
; PLAN: r0=225(x), r1=49(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 49
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
