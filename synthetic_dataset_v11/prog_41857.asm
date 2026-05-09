; DESCRIPTION: Places a cyan circle of radius 33 at center (55, 77).
; PLAN: r0=55(x), r1=77(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 77
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
