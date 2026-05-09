; DESCRIPTION: Creates a cyan circular shape at (93, 160) with radius 32.
; PLAN: r0=93(x), r1=160(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 160
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
