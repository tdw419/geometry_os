; DESCRIPTION: Places a red circle of radius 28 at center (313, 103).
; PLAN: r0=313(x), r1=103(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 103
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
