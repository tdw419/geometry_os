; DESCRIPTION: Places a yellow circle of radius 57 at center (352, 103).
; PLAN: r0=352(x), r1=103(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 103
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
