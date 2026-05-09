; DESCRIPTION: Places a blue circle of radius 53 at center (82, 87).
; PLAN: r0=82(x), r1=87(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 87
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
