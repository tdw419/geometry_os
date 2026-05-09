; DESCRIPTION: Renders a cyan disk with center (234, 115) and radius 15.
; PLAN: r0=234(x), r1=115(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 115
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
