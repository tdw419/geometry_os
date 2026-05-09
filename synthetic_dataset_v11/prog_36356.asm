; DESCRIPTION: Composite: . Then Draws a black circle centered at (113, 30) with radius 16. Then Renders a blue box of size 55x44 starting at (99, 132).
; PLAN: r0=113(x), r1=30(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=99(x), r1=132(y), r2=55(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black circle centered at (113, 30) with radius 16.
; PLAN: r0=113(x), r1=30(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 30
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a blue box of size 55x44 starting at (99, 132).
; PLAN: r0=99(x), r1=132(y), r2=55(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 132
LDI r2, 55
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
