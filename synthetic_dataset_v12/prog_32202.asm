; DESCRIPTION: Places a cyan circle of radius 65 at center (179, 183).
; PLAN: r0=179(x), r1=183(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 183
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
