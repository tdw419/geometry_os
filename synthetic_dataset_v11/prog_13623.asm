; DESCRIPTION: Composite: . Then Draws a black circle centered at (55, 104) with radius 47. Then Places a blue 90x69 rectangle at position (52, 178).
; PLAN: r0=55(x), r1=104(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=52(x), r1=178(y), r2=90(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black circle centered at (55, 104) with radius 47.
; PLAN: r0=55(x), r1=104(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 104
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue 90x69 rectangle at position (52, 178).
; PLAN: r0=52(x), r1=178(y), r2=90(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 178
LDI r2, 90
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
