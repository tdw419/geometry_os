; DESCRIPTION: Creates a cyan circular shape at (176, 169) with radius 57.
; PLAN: r0=176(x), r1=169(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 169
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
