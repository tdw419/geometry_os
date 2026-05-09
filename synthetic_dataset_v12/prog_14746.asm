; DESCRIPTION: Places a blue circle of radius 18 at center (460, 155).
; PLAN: r0=460(x), r1=155(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 155
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
