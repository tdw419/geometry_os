; DESCRIPTION: Places a cyan circle of radius 35 at center (44, 79).
; PLAN: r0=44(x), r1=79(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 79
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
