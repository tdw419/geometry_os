; DESCRIPTION: Places a purple circle of radius 42 at center (238, 152).
; PLAN: r0=238(x), r1=152(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 152
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
