; DESCRIPTION: Places a cyan circle of radius 35 at center (170, 58).
; PLAN: r0=170(x), r1=58(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 58
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
