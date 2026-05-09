; DESCRIPTION: Renders a cyan disk with center (245, 51) and radius 38.
; PLAN: r0=245(x), r1=51(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 51
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
