; DESCRIPTION: Places a yellow circle of radius 74 at center (138, 180).
; PLAN: r0=138(x), r1=180(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 180
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
