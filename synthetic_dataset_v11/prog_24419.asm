; DESCRIPTION: Composite: . Then Places a blue 108x81 rectangle at position (72, 170). Then Creates a yellow circular shape at (189, 42) with radius 36.
; PLAN: r0=72(x), r1=170(y), r2=108(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=189(x), r1=42(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue 108x81 rectangle at position (72, 170).
; PLAN: r0=72(x), r1=170(y), r2=108(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 170
LDI r2, 108
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow circular shape at (189, 42) with radius 36.
; PLAN: r0=189(x), r1=42(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 42
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
