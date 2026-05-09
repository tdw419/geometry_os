; DESCRIPTION: Renders a blue disk with center (188, 154) and radius 59.
; PLAN: r0=188(x), r1=154(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 154
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
