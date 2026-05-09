; DESCRIPTION: Composite: . Then Draws a blue circle centered at (96, 45) with radius 37. Then Places a black 16x63 rectangle at position (101, 66).
; PLAN: r0=96(x), r1=45(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=101(x), r1=66(y), r2=16(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (96, 45) with radius 37.
; PLAN: r0=96(x), r1=45(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 45
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black 16x63 rectangle at position (101, 66).
; PLAN: r0=101(x), r1=66(y), r2=16(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 66
LDI r2, 16
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
