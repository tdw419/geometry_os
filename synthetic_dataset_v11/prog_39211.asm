; DESCRIPTION: Places a cyan circle of radius 28 at center (207, 66).
; PLAN: r0=207(x), r1=66(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 66
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
