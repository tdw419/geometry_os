; DESCRIPTION: Renders a cyan disk with center (324, 89) and radius 34.
; PLAN: r0=324(x), r1=89(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 89
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
