; DESCRIPTION: Renders a cyan disk with center (36, 61) and radius 19.
; PLAN: r0=36(x), r1=61(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 61
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
