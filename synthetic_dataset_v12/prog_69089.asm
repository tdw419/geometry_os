; DESCRIPTION: Places a cyan circle of radius 61 at center (444, 106).
; PLAN: r0=444(x), r1=106(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 106
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
