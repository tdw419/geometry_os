; DESCRIPTION: Renders a green disk with center (72, 222) and radius 29.
; PLAN: r0=72(x), r1=222(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 222
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
