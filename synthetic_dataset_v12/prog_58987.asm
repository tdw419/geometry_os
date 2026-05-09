; DESCRIPTION: Places a cyan circle of radius 35 at center (456, 99).
; PLAN: r0=456(x), r1=99(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 99
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
