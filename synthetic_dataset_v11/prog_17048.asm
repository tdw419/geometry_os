; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (40, 78) with radius 25. Then Places a purple 89x40 rectangle at position (26, 94).
; PLAN: r0=40(x), r1=78(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=26(x), r1=94(y), r2=89(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan circular shape at (40, 78) with radius 25.
; PLAN: r0=40(x), r1=78(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 78
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple 89x40 rectangle at position (26, 94).
; PLAN: r0=26(x), r1=94(y), r2=89(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 94
LDI r2, 89
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
