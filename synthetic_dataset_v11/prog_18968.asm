; DESCRIPTION: Places a yellow circle of radius 21 at center (210, 82).
; PLAN: r0=210(x), r1=82(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 82
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
