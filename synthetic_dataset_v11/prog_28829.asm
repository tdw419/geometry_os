; DESCRIPTION: Composite: . Then Places a purple circle of radius 39 at center (195, 209). Then Draws a purple rectangle at (170, 92) with width 66 and height 19.
; PLAN: r0=195(x), r1=209(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=170(x), r1=92(y), r2=66(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple circle of radius 39 at center (195, 209).
; PLAN: r0=195(x), r1=209(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 209
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple rectangle at (170, 92) with width 66 and height 19.
; PLAN: r0=170(x), r1=92(y), r2=66(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 92
LDI r2, 66
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
