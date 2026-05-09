; DESCRIPTION: Renders a cyan disk with center (170, 158) and radius 61.
; PLAN: r0=170(x), r1=158(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 158
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
