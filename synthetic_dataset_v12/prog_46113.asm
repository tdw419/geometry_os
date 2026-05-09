; DESCRIPTION: Places a cyan circle of radius 47 at center (313, 55).
; PLAN: r0=313(x), r1=55(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 55
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
