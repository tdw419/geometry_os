; DESCRIPTION: Creates a cyan circular shape at (412, 99) with radius 32.
; PLAN: r0=412(x), r1=99(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 99
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
