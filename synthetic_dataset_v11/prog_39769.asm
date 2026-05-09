; DESCRIPTION: Places a yellow circle of radius 39 at center (141, 171).
; PLAN: r0=141(x), r1=171(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 171
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
