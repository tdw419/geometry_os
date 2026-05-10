; DESCRIPTION: Creates a cyan circular shape at (370, 147) with radius 37.
; PLAN: r0=370(x), r1=147(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 147
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
