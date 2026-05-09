; DESCRIPTION: Creates a cyan circular shape at (91, 110) with radius 64.
; PLAN: r0=91(x), r1=110(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 110
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
