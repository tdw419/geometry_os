; DESCRIPTION: Renders a cyan disk with center (124, 49) and radius 47.
; PLAN: r0=124(x), r1=49(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 49
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
