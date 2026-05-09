; DESCRIPTION: Places a blue circle of radius 57 at center (169, 138).
; PLAN: r0=169(x), r1=138(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 138
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
