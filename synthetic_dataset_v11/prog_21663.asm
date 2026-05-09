; DESCRIPTION: Places a yellow circle of radius 33 at center (214, 141).
; PLAN: r0=214(x), r1=141(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 141
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
