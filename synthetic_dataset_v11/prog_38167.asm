; DESCRIPTION: Composite: . Then Places a black 45x34 rectangle at position (56, 144). Then Creates a yellow circular shape at (99, 53) with radius 45.
; PLAN: r0=56(x), r1=144(y), r2=45(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=99(x), r1=53(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black 45x34 rectangle at position (56, 144).
; PLAN: r0=56(x), r1=144(y), r2=45(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 144
LDI r2, 45
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow circular shape at (99, 53) with radius 45.
; PLAN: r0=99(x), r1=53(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 53
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
