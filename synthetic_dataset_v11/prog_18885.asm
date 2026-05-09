; DESCRIPTION: Renders a green disk with center (68, 75) and radius 29.
; PLAN: r0=68(x), r1=75(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 75
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
