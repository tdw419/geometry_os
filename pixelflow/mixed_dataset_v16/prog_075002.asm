; DESCRIPTION: Places a red circle of radius 35 at center (72, 69).
; PLAN: r0=72(x), r1=69(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 69
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
