; DESCRIPTION: Renders a white disk with center (118, 162) and radius 35.
; PLAN: r0=118(x), r1=162(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 162
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
