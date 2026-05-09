; DESCRIPTION: Places a blue circle of radius 65 at center (189, 138).
; PLAN: r0=189(x), r1=138(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 138
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
