; DESCRIPTION: Renders a cyan disk with center (110, 114) and radius 78.
; PLAN: r0=110(x), r1=114(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 114
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
