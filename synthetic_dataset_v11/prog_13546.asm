; DESCRIPTION: Places a cyan circle of radius 44 at center (55, 93).
; PLAN: r0=55(x), r1=93(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 93
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
