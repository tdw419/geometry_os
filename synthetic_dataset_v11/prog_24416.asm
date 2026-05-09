; DESCRIPTION: Places a purple circle of radius 47 at center (177, 108).
; PLAN: r0=177(x), r1=108(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 108
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
