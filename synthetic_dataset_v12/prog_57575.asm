; DESCRIPTION: Places a yellow circle of radius 32 at center (311, 60).
; PLAN: r0=311(x), r1=60(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 60
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
