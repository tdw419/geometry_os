; DESCRIPTION: Creates a cyan circular shape at (366, 217) with radius 12.
; PLAN: r0=366(x), r1=217(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 217
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
