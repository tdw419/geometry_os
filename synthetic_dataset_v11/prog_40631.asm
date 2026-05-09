; DESCRIPTION: Composite: . Then Creates a black circular shape at (86, 198) with radius 37. Then Places a yellow 58x29 rectangle at position (84, 192).
; PLAN: r0=86(x), r1=198(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=84(x), r1=192(y), r2=58(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black circular shape at (86, 198) with radius 37.
; PLAN: r0=86(x), r1=198(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 198
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow 58x29 rectangle at position (84, 192).
; PLAN: r0=84(x), r1=192(y), r2=58(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 192
LDI r2, 58
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
