; DESCRIPTION: Places a purple circle of radius 70 at center (178, 138).
; PLAN: r0=178(x), r1=138(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 138
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
