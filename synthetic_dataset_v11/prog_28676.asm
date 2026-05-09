; DESCRIPTION: Places a red circle of radius 44 at center (193, 139).
; PLAN: r0=193(x), r1=139(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 139
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
