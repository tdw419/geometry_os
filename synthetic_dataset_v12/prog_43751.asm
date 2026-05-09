; DESCRIPTION: Creates a cyan circular shape at (331, 147) with radius 58.
; PLAN: r0=331(x), r1=147(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 147
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
