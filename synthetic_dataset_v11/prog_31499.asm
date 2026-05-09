; DESCRIPTION: Renders a cyan disk with center (177, 29) and radius 10.
; PLAN: r0=177(x), r1=29(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 29
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
