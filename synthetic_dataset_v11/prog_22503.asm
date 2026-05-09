; DESCRIPTION: Composite: . Then Places a blue circle of radius 64 at center (148, 124). Then Places a yellow 49x58 rectangle at position (103, 126).
; PLAN: r0=148(x), r1=124(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=103(x), r1=126(y), r2=49(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue circle of radius 64 at center (148, 124).
; PLAN: r0=148(x), r1=124(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 124
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow 49x58 rectangle at position (103, 126).
; PLAN: r0=103(x), r1=126(y), r2=49(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 126
LDI r2, 49
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
