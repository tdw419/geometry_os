; DESCRIPTION: Renders a blue circular shape at (367, 174) with radius 25.
; PLAN: r0=367(x), r1=174(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 174
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
