; DESCRIPTION: Places a yellow circle of radius 74 at center (81, 152).
; PLAN: r0=81(x), r1=152(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 152
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
