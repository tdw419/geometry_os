; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (196, 148) with radius 33. Then Places a green 70x58 rectangle at position (119, 11).
; PLAN: r0=196(x), r1=148(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=119(x), r1=11(y), r2=70(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (196, 148) with radius 33.
; PLAN: r0=196(x), r1=148(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 148
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green 70x58 rectangle at position (119, 11).
; PLAN: r0=119(x), r1=11(y), r2=70(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 11
LDI r2, 70
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
