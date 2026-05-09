; DESCRIPTION: Places a cyan circle of radius 66 at center (74, 99).
; PLAN: r0=74(x), r1=99(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 99
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
