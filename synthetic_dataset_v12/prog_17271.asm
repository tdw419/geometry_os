; DESCRIPTION: Renders a cyan disk with center (29, 184) and radius 23.
; PLAN: r0=29(x), r1=184(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 29
LDI r1, 184
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
