; DESCRIPTION: Creates a cyan circular shape at (354, 90) with radius 36.
; PLAN: r0=354(x), r1=90(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 90
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
