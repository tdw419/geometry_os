; DESCRIPTION: Places a cyan circle of radius 22 at center (40, 195).
; PLAN: r0=40(x), r1=195(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 195
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
