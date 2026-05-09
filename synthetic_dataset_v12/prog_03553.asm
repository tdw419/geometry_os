; DESCRIPTION: Renders a cyan disk with center (185, 199) and radius 39.
; PLAN: r0=185(x), r1=199(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 199
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
