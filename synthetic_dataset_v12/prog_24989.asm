; DESCRIPTION: Creates a cyan circular shape at (102, 156) with radius 60.
; PLAN: r0=102(x), r1=156(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 156
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
