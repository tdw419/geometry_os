; DESCRIPTION: Renders a red disk with center (400, 181) and radius 37.
; PLAN: r0=400(x), r1=181(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 181
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
