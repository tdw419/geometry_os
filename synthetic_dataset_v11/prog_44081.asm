; DESCRIPTION: Composite: . Then Draws a purple rectangle at (72, 209) with width 104 and height 45. Then Places a green circle of radius 28 at center (33, 97).
; PLAN: r0=72(x), r1=209(y), r2=104(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=33(x), r1=97(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple rectangle at (72, 209) with width 104 and height 45.
; PLAN: r0=72(x), r1=209(y), r2=104(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 209
LDI r2, 104
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 28 at center (33, 97).
; PLAN: r0=33(x), r1=97(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 33
LDI r1, 97
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
