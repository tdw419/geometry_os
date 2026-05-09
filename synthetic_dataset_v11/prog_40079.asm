; DESCRIPTION: Creates a cyan circular shape at (182, 140) with radius 73.
; PLAN: r0=182(x), r1=140(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 140
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
