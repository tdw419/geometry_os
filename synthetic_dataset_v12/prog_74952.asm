; DESCRIPTION: Places a yellow circle of radius 15 at center (197, 148).
; PLAN: r0=197(x), r1=148(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 148
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
