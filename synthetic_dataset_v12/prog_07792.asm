; DESCRIPTION: Renders a white disk with center (162, 69) and radius 55.
; PLAN: r0=162(x), r1=69(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 69
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
