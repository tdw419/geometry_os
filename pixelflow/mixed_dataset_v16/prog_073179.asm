; DESCRIPTION: Renders a yellow circular shape at (322, 104) with radius 69.
; PLAN: r0=322(x), r1=104(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 104
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
