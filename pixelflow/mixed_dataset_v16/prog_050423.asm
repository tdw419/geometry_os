; DESCRIPTION: Creates a cyan circular shape at (416, 147) with radius 24.
; PLAN: r0=416(x), r1=147(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 147
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
