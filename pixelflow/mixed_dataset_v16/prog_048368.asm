; DESCRIPTION: Creates a cyan circular shape at (111, 90) with radius 32.
; PLAN: r0=111(x), r1=90(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 90
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
