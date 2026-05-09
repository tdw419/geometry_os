; DESCRIPTION: Renders a green disk with center (95, 193) and radius 34.
; PLAN: r0=95(x), r1=193(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 193
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
