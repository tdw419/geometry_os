; DESCRIPTION: Places a blue circle of radius 35 at center (121, 81).
; PLAN: r0=121(x), r1=81(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 81
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
