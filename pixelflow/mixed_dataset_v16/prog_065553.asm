; DESCRIPTION: Renders a cyan disk with center (36, 112) and radius 14.
; PLAN: r0=36(x), r1=112(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 112
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
