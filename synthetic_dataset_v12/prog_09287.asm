; DESCRIPTION: Creates a cyan circular shape at (122, 146) with radius 69.
; PLAN: r0=122(x), r1=146(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 146
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
