; DESCRIPTION: Places a yellow circle of radius 60 at center (119, 134).
; PLAN: r0=119(x), r1=134(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 134
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
