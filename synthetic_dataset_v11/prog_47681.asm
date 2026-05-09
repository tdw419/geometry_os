; DESCRIPTION: Places a cyan circle of radius 39 at center (44, 39).
; PLAN: r0=44(x), r1=39(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 39
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
