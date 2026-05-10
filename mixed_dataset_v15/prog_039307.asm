; DESCRIPTION: Places a green circle of radius 10 at center (223, 59).
; PLAN: r0=223(x), r1=59(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 59
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
