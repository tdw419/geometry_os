; DESCRIPTION: Places a cyan circle of radius 39 at center (315, 102).
; PLAN: r0=315(x), r1=102(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 102
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
