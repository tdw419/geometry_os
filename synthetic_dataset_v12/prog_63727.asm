; DESCRIPTION: Creates a cyan circular shape at (328, 159) with radius 49.
; PLAN: r0=328(x), r1=159(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 159
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
