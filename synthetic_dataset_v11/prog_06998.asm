; DESCRIPTION: Creates a cyan circular shape at (210, 107) with radius 19.
; PLAN: r0=210(x), r1=107(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 107
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
