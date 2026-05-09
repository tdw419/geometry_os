; DESCRIPTION: Renders a cyan disk with center (189, 169) and radius 74.
; PLAN: r0=189(x), r1=169(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 169
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
