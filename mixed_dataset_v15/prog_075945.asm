; DESCRIPTION: Places a purple circle of radius 41 at center (191, 177).
; PLAN: r0=191(x), r1=177(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 177
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
