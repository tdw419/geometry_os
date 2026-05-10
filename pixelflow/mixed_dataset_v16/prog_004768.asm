; DESCRIPTION: Places a purple circle of radius 77 at center (346, 168).
; PLAN: r0=346(x), r1=168(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 168
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
