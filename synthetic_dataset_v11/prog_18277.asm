; DESCRIPTION: Composite: . Then Places a black 62x92 rectangle at position (2, 4). Then Creates a purple circular shape at (89, 123) with radius 38.
; PLAN: r0=2(x), r1=4(y), r2=62(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=89(x), r1=123(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black 62x92 rectangle at position (2, 4).
; PLAN: r0=2(x), r1=4(y), r2=62(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 4
LDI r2, 62
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (89, 123) with radius 38.
; PLAN: r0=89(x), r1=123(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 123
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
