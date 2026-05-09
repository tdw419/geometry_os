; DESCRIPTION: Renders a cyan disk with center (53, 124) and radius 22.
; PLAN: r0=53(x), r1=124(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 124
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
