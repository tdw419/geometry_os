; DESCRIPTION: Renders a blue disk with center (197, 130) and radius 30.
; PLAN: r0=197(x), r1=130(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 130
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
