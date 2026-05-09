; DESCRIPTION: Places a yellow circle of radius 42 at center (117, 140).
; PLAN: r0=117(x), r1=140(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 140
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
