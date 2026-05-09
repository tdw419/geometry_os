; DESCRIPTION: Places a red circle of radius 22 at center (54, 81).
; PLAN: r0=54(x), r1=81(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 81
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
