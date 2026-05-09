; DESCRIPTION: Renders a green disk with center (210, 126) and radius 66.
; PLAN: r0=210(x), r1=126(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 126
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
