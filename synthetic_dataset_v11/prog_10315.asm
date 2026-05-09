; DESCRIPTION: Creates a cyan circular shape at (64, 120) with radius 44.
; PLAN: r0=64(x), r1=120(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 120
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
