; DESCRIPTION: Composite: . Then Draws a blue circle centered at (96, 76) with radius 12. Then Places a black 79x40 rectangle at position (54, 66).
; PLAN: r0=96(x), r1=76(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=54(x), r1=66(y), r2=79(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (96, 76) with radius 12.
; PLAN: r0=96(x), r1=76(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 76
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black 79x40 rectangle at position (54, 66).
; PLAN: r0=54(x), r1=66(y), r2=79(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 66
LDI r2, 79
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
