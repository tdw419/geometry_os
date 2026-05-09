; DESCRIPTION: Renders a green disk with center (480, 66) and radius 20.
; PLAN: r0=480(x), r1=66(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 480
LDI r1, 66
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
