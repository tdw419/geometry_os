; DESCRIPTION: Creates a cyan circular shape at (45, 67) with radius 39.
; PLAN: r0=45(x), r1=67(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 67
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
