; DESCRIPTION: Composite: . Then Places a black 25x21 rectangle at position (204, 21). Then Creates a purple circular shape at (90, 153) with radius 29.
; PLAN: r0=204(x), r1=21(y), r2=25(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=90(x), r1=153(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black 25x21 rectangle at position (204, 21).
; PLAN: r0=204(x), r1=21(y), r2=25(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 21
LDI r2, 25
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (90, 153) with radius 29.
; PLAN: r0=90(x), r1=153(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 153
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
