; DESCRIPTION: Renders a cyan disk with center (409, 179) and radius 47.
; PLAN: r0=409(x), r1=179(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 179
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
