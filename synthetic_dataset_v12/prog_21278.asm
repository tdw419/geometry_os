; DESCRIPTION: Creates a cyan circular shape at (205, 109) with radius 52.
; PLAN: r0=205(x), r1=109(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 109
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
