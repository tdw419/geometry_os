; DESCRIPTION: Renders a green disk with center (112, 70) and radius 40.
; PLAN: r0=112(x), r1=70(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 70
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
