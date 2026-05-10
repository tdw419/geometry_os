; DESCRIPTION: Renders a green disk with center (468, 79) and radius 22.
; PLAN: r0=468(x), r1=79(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 79
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
