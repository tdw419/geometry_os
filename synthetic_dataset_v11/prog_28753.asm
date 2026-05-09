; DESCRIPTION: Renders a cyan disk with center (71, 171) and radius 18.
; PLAN: r0=71(x), r1=171(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 171
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
