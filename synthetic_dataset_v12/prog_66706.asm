; DESCRIPTION: Places a purple circle of radius 59 at center (365, 59).
; PLAN: r0=365(x), r1=59(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 59
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
