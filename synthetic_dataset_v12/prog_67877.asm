; DESCRIPTION: Places a yellow circle of radius 17 at center (263, 233).
; PLAN: r0=263(x), r1=233(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 233
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
