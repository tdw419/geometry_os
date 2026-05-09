; DESCRIPTION: Creates a cyan circular shape at (116, 114) with radius 55.
; PLAN: r0=116(x), r1=114(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 114
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
