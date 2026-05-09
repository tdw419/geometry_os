; DESCRIPTION: Renders a blue disk with center (68, 154) and radius 22.
; PLAN: r0=68(x), r1=154(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 154
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
