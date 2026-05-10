; DESCRIPTION: Places a purple disk with center (377, 42) and radius 74.
; PLAN: r0=377(x), r1=42(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 42
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
