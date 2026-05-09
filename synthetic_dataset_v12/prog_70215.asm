; DESCRIPTION: Renders a blue disk with center (455, 129) and radius 14.
; PLAN: r0=455(x), r1=129(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 129
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
