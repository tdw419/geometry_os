; DESCRIPTION: Renders a cyan disk with center (84, 201) and radius 29.
; PLAN: r0=84(x), r1=201(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 201
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
