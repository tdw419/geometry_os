; DESCRIPTION: Renders a cyan disk with center (421, 71) and radius 51.
; PLAN: r0=421(x), r1=71(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 71
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
