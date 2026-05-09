; DESCRIPTION: Places a purple circle of radius 46 at center (262, 210).
; PLAN: r0=262(x), r1=210(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 210
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
