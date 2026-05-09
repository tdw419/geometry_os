; DESCRIPTION: Renders a cyan disk with center (88, 149) and radius 80.
; PLAN: r0=88(x), r1=149(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 149
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
