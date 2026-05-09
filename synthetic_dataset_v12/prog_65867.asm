; DESCRIPTION: Renders a cyan disk with center (195, 160) and radius 78.
; PLAN: r0=195(x), r1=160(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 160
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
