; DESCRIPTION: Renders a cyan disk with center (66, 115) and radius 52.
; PLAN: r0=66(x), r1=115(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 115
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
