; DESCRIPTION: Places a yellow circle of radius 64 at center (387, 87).
; PLAN: r0=387(x), r1=87(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 87
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
