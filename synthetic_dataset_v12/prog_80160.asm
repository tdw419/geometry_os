; DESCRIPTION: Creates a cyan circular shape at (365, 69) with radius 39.
; PLAN: r0=365(x), r1=69(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 69
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
