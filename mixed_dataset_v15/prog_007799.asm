; DESCRIPTION: Places a purple circle of radius 29 at center (464, 41).
; PLAN: r0=464(x), r1=41(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 41
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
