; DESCRIPTION: Renders a blue disk with center (202, 160) and radius 78.
; PLAN: r0=202(x), r1=160(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 160
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
