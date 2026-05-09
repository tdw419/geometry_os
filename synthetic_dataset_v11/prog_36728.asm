; DESCRIPTION: Creates a cyan circular shape at (36, 25) with radius 13.
; PLAN: r0=36(x), r1=25(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 25
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
