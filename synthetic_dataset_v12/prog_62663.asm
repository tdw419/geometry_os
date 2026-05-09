; DESCRIPTION: Renders a cyan disk with center (115, 100) and radius 39.
; PLAN: r0=115(x), r1=100(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 100
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
