; DESCRIPTION: Renders a cyan disk with center (361, 76) and radius 73.
; PLAN: r0=361(x), r1=76(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 76
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
