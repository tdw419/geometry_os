; DESCRIPTION: Places a cyan circle of radius 52 at center (306, 85).
; PLAN: r0=306(x), r1=85(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 85
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
