; DESCRIPTION: Renders a white disk with center (369, 174) and radius 73.
; PLAN: r0=369(x), r1=174(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 174
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
