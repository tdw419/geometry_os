; DESCRIPTION: Places a blue circle of radius 11 at center (121, 92).
; PLAN: r0=121(x), r1=92(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 92
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
