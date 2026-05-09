; DESCRIPTION: Places a purple circle of radius 65 at center (147, 177).
; PLAN: r0=147(x), r1=177(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 177
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
