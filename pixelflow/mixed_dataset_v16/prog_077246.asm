; DESCRIPTION: Renders a purple disk with center (91, 124) and radius 56.
; PLAN: r0=91(x), r1=124(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 124
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
