; DESCRIPTION: Creates a cyan circular shape at (308, 141) with radius 78.
; PLAN: r0=308(x), r1=141(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 141
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
