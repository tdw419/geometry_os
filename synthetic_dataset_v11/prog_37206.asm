; DESCRIPTION: Composite: . Then Places a black 10x13 rectangle at position (84, 126). Then Creates a purple circular shape at (148, 123) with radius 63.
; PLAN: r0=84(x), r1=126(y), r2=10(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=148(x), r1=123(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black 10x13 rectangle at position (84, 126).
; PLAN: r0=84(x), r1=126(y), r2=10(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 126
LDI r2, 10
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (148, 123) with radius 63.
; PLAN: r0=148(x), r1=123(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 123
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
