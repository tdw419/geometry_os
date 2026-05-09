; DESCRIPTION: Renders a white disk with center (104, 186) and radius 51.
; PLAN: r0=104(x), r1=186(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 186
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
