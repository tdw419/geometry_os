; DESCRIPTION: Renders a cyan disk with center (157, 211) and radius 19.
; PLAN: r0=157(x), r1=211(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 211
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
