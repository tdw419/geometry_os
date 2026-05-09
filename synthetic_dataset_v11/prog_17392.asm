; DESCRIPTION: Places a yellow circle of radius 59 at center (148, 135).
; PLAN: r0=148(x), r1=135(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 135
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
