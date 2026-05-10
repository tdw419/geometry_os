; DESCRIPTION: Renders a yellow disk with center (280, 214) and radius 20.
; PLAN: r0=280(x), r1=214(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 214
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
