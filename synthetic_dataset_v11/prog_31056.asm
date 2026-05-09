; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (148, 97) with radius 66. Then Places a blue 51x25 rectangle at position (99, 90).
; PLAN: r0=148(x), r1=97(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=99(x), r1=90(y), r2=51(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow circle centered at (148, 97) with radius 66.
; PLAN: r0=148(x), r1=97(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 97
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue 51x25 rectangle at position (99, 90).
; PLAN: r0=99(x), r1=90(y), r2=51(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 90
LDI r2, 51
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
