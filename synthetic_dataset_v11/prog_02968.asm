; DESCRIPTION: Renders a cyan disk with center (176, 43) and radius 11.
; PLAN: r0=176(x), r1=43(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 43
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
