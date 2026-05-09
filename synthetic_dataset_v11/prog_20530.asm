; DESCRIPTION: Places a green circle of radius 13 at center (61, 59).
; PLAN: r0=61(x), r1=59(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 59
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
