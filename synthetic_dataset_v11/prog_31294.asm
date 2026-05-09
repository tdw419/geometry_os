; DESCRIPTION: Renders a cyan disk with center (93, 28) and radius 20.
; PLAN: r0=93(x), r1=28(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 28
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
