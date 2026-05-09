; DESCRIPTION: Places a yellow circle of radius 66 at center (259, 121).
; PLAN: r0=259(x), r1=121(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 121
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
