; DESCRIPTION: Places a purple circle of radius 65 at center (101, 169).
; PLAN: r0=101(x), r1=169(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 169
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
