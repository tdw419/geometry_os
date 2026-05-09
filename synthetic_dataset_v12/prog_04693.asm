; DESCRIPTION: Renders a cyan disk with center (409, 163) and radius 35.
; PLAN: r0=409(x), r1=163(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 163
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
