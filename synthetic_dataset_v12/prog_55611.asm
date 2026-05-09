; DESCRIPTION: Renders a green disk with center (470, 29) and radius 24.
; PLAN: r0=470(x), r1=29(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 470
LDI r1, 29
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
