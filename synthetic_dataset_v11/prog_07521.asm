; DESCRIPTION: Creates a cyan circular shape at (91, 53) with radius 13.
; PLAN: r0=91(x), r1=53(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 53
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
