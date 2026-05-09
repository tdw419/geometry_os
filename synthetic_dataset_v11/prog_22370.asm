; DESCRIPTION: Places a purple circle of radius 28 at center (59, 223).
; PLAN: r0=59(x), r1=223(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 223
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
