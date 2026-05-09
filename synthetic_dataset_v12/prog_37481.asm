; DESCRIPTION: Renders a green disk with center (220, 162) and radius 38.
; PLAN: r0=220(x), r1=162(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 162
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
