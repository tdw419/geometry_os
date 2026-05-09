; DESCRIPTION: Renders a green disk with center (83, 93) and radius 60.
; PLAN: r0=83(x), r1=93(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 93
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
