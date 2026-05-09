; DESCRIPTION: Places a yellow circle of radius 57 at center (221, 177).
; PLAN: r0=221(x), r1=177(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 177
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
