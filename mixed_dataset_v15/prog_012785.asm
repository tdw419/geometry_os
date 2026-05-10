; DESCRIPTION: Places a yellow circle of radius 67 at center (388, 177).
; PLAN: r0=388(x), r1=177(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 177
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
