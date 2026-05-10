; DESCRIPTION: Renders a blue disk with center (418, 146) and radius 56.
; PLAN: r0=418(x), r1=146(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 146
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
