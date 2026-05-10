; DESCRIPTION: Places a purple disk with center (385, 154) and radius 69.
; PLAN: r0=385(x), r1=154(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 154
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
