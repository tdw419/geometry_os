; DESCRIPTION: Renders a cyan disk with center (49, 118) and radius 48.
; PLAN: r0=49(x), r1=118(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 118
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
