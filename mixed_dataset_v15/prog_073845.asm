; DESCRIPTION: Creates a cyan circular shape at (339, 166) with radius 36.
; PLAN: r0=339(x), r1=166(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 166
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
