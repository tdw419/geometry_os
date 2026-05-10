; DESCRIPTION: Places a cyan circle of radius 37 at center (194, 158).
; PLAN: r0=194(x), r1=158(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 158
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
