; DESCRIPTION: Renders a yellow disk with center (89, 70) and radius 16.
; PLAN: r0=89(x), r1=70(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 70
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
