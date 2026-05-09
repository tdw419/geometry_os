; DESCRIPTION: Creates a cyan circular shape at (139, 146) with radius 63.
; PLAN: r0=139(x), r1=146(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 146
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
