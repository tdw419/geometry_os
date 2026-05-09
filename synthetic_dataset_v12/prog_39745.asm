; DESCRIPTION: Renders a cyan disk with center (176, 101) and radius 73.
; PLAN: r0=176(x), r1=101(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 101
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
