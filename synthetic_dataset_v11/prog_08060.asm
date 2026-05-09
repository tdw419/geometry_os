; DESCRIPTION: Places a purple circle of radius 53 at center (154, 68).
; PLAN: r0=154(x), r1=68(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 68
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
