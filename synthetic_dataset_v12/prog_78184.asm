; DESCRIPTION: Renders a cyan disk with center (388, 62) and radius 53.
; PLAN: r0=388(x), r1=62(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 62
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
