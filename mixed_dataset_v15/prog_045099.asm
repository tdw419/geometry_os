; DESCRIPTION: Renders a green disk with center (66, 171) and radius 23.
; PLAN: r0=66(x), r1=171(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 171
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
