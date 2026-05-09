; DESCRIPTION: Composite: . Then Places a purple 108x32 rectangle at position (54, 151). Then Draws a orange circle centered at (170, 84) with radius 48.
; PLAN: r0=54(x), r1=151(y), r2=108(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=170(x), r1=84(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple 108x32 rectangle at position (54, 151).
; PLAN: r0=54(x), r1=151(y), r2=108(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 151
LDI r2, 108
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange circle centered at (170, 84) with radius 48.
; PLAN: r0=170(x), r1=84(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 84
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
