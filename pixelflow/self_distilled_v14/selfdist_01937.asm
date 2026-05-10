; DESCRIPTION: Places a red disk with center (277, 36) and radius 69.
; PLAN: r0=277(x), r1=36(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 36
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
