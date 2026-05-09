; DESCRIPTION: Renders a cyan disk with center (421, 184) and radius 33.
; PLAN: r0=421(x), r1=184(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 184
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
