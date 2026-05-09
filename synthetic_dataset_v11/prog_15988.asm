; DESCRIPTION: Composite: . Then Places a blue circle of radius 58 at center (122, 100). Then Places a yellow 111x84 rectangle at position (5, 81).
; PLAN: r0=122(x), r1=100(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=5(x), r1=81(y), r2=111(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue circle of radius 58 at center (122, 100).
; PLAN: r0=122(x), r1=100(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 100
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow 111x84 rectangle at position (5, 81).
; PLAN: r0=5(x), r1=81(y), r2=111(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 81
LDI r2, 111
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
