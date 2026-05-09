; DESCRIPTION: Places a red circle of radius 53 at center (59, 101).
; PLAN: r0=59(x), r1=101(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 101
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
