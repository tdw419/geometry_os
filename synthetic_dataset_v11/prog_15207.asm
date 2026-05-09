; DESCRIPTION: Composite: . Then Renders a purple line between points (31, 92) and (139, 249). Then Creates a cyan circular shape at (150, 128) with radius 31.
; PLAN: r0=31(x1), r1=92(y1), r2=139(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=150(x), r1=128(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple line between points (31, 92) and (139, 249).
; PLAN: r0=31(x1), r1=92(y1), r2=139(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 92
LDI r2, 139
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (150, 128) with radius 31.
; PLAN: r0=150(x), r1=128(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 128
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
