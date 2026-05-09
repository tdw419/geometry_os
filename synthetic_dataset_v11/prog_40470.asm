; DESCRIPTION: Creates a cyan circular shape at (187, 183) with radius 12.
; PLAN: r0=187(x), r1=183(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 183
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
