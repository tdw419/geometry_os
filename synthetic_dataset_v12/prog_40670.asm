; DESCRIPTION: Places a yellow circle of radius 33 at center (423, 210).
; PLAN: r0=423(x), r1=210(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 210
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
