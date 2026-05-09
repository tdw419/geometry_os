; DESCRIPTION: Composite: . Then Places a purple circle of radius 43 at center (199, 103). Then Places a purple 22x88 rectangle at position (196, 92).
; PLAN: r0=199(x), r1=103(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=196(x), r1=92(y), r2=22(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple circle of radius 43 at center (199, 103).
; PLAN: r0=199(x), r1=103(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 103
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple 22x88 rectangle at position (196, 92).
; PLAN: r0=196(x), r1=92(y), r2=22(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 92
LDI r2, 22
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
