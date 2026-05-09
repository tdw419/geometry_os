; DESCRIPTION: Renders a green disk with center (215, 158) and radius 77.
; PLAN: r0=215(x), r1=158(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 158
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
