; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (44, 170) with radius 16. Then Places a black 40x60 rectangle at position (34, 4).
; PLAN: r0=44(x), r1=170(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=34(x), r1=4(y), r2=40(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (44, 170) with radius 16.
; PLAN: r0=44(x), r1=170(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 170
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black 40x60 rectangle at position (34, 4).
; PLAN: r0=34(x), r1=4(y), r2=40(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 4
LDI r2, 40
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
