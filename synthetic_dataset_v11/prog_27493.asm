; DESCRIPTION: Renders a cyan disk with center (111, 105) and radius 71.
; PLAN: r0=111(x), r1=105(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 105
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
