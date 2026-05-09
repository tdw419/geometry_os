; DESCRIPTION: Places a blue circle of radius 44 at center (74, 121).
; PLAN: r0=74(x), r1=121(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 121
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
