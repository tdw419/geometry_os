; DESCRIPTION: Renders a red disk with center (104, 69) and radius 55.
; PLAN: r0=104(x), r1=69(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 69
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
