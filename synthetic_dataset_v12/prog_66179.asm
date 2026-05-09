; DESCRIPTION: Renders a yellow disk with center (366, 160) and radius 69.
; PLAN: r0=366(x), r1=160(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 160
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
