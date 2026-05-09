; DESCRIPTION: Places a yellow circle of radius 50 at center (148, 71).
; PLAN: r0=148(x), r1=71(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 71
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
