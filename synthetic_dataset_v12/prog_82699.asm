; DESCRIPTION: Places a black circle of radius 25 at center (387, 84).
; PLAN: r0=387(x), r1=84(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 84
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
