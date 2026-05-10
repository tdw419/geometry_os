; DESCRIPTION: Renders a blue circular shape at (186, 43) with radius 43.
; PLAN: r0=186(x), r1=43(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 43
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
