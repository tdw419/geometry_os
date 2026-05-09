; DESCRIPTION: Places a cyan circle of radius 20 at center (161, 119).
; PLAN: r0=161(x), r1=119(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 119
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
