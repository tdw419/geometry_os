; DESCRIPTION: Places a yellow circle of radius 45 at center (280, 60).
; PLAN: r0=280(x), r1=60(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 60
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
