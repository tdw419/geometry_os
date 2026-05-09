; DESCRIPTION: Renders a cyan disk with center (332, 66) and radius 10.
; PLAN: r0=332(x), r1=66(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 66
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
