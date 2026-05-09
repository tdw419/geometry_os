; DESCRIPTION: Renders a green disk with center (164, 106) and radius 75.
; PLAN: r0=164(x), r1=106(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 106
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
