; DESCRIPTION: Creates a cyan circular shape at (79, 123) with radius 67.
; PLAN: r0=79(x), r1=123(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 123
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
