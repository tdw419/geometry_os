; DESCRIPTION: Renders a green disk with center (190, 171) and radius 55.
; PLAN: r0=190(x), r1=171(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 171
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
