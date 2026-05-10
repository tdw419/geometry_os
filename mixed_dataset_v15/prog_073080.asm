; DESCRIPTION: Creates a cyan circular shape at (303, 183) with radius 36.
; PLAN: r0=303(x), r1=183(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 183
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
