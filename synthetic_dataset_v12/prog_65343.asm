; DESCRIPTION: Places a cyan circle of radius 13 at center (149, 178).
; PLAN: r0=149(x), r1=178(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 178
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
