; DESCRIPTION: Places a red circle of radius 28 at center (62, 44).
; PLAN: r0=62(x), r1=44(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 44
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
