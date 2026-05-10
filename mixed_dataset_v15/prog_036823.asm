; DESCRIPTION: Places a yellow circle of radius 38 at center (217, 73).
; PLAN: r0=217(x), r1=73(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 73
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
