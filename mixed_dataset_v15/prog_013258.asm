; DESCRIPTION: Places a red circle of radius 35 at center (286, 59).
; PLAN: r0=286(x), r1=59(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 59
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
