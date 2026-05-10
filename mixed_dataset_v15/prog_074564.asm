; DESCRIPTION: Renders a green disk with center (107, 220) and radius 10.
; PLAN: r0=107(x), r1=220(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 220
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
