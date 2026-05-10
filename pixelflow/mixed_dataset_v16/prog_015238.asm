; DESCRIPTION: Places a cyan circle of radius 10 at center (306, 114).
; PLAN: r0=306(x), r1=114(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 114
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
