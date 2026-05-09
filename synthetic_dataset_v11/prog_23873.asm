; DESCRIPTION: Renders a cyan disk with center (141, 105) and radius 72.
; PLAN: r0=141(x), r1=105(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 105
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
