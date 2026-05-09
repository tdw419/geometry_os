; DESCRIPTION: Places a blue circle of radius 72 at center (74, 83).
; PLAN: r0=74(x), r1=83(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 83
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
