; DESCRIPTION: Creates a cyan circular shape at (23, 197) with radius 11.
; PLAN: r0=23(x), r1=197(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 23
LDI r1, 197
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
