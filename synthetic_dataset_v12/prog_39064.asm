; DESCRIPTION: Renders a cyan disk with center (97, 177) and radius 52.
; PLAN: r0=97(x), r1=177(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 177
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
