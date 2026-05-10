; DESCRIPTION: Places a purple circle of radius 59 at center (106, 150).
; PLAN: r0=106(x), r1=150(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 150
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
