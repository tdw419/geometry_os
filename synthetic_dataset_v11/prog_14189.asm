; DESCRIPTION: Places a yellow circle of radius 71 at center (81, 88).
; PLAN: r0=81(x), r1=88(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 88
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
