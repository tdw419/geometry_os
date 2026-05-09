; DESCRIPTION: Renders a cyan disk with center (201, 175) and radius 60.
; PLAN: r0=201(x), r1=175(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 175
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
