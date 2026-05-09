; DESCRIPTION: Places a cyan circle of radius 68 at center (334, 101).
; PLAN: r0=334(x), r1=101(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 101
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
