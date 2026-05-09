; DESCRIPTION: Creates a cyan circular shape at (333, 94) with radius 32.
; PLAN: r0=333(x), r1=94(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 94
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
