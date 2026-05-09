; DESCRIPTION: Composite: . Then Renders a purple disk with center (47, 130) and radius 39. Then Places a blue 44x96 rectangle at position (9, 135).
; PLAN: r0=47(x), r1=130(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=9(x), r1=135(y), r2=44(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (47, 130) and radius 39.
; PLAN: r0=47(x), r1=130(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 130
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue 44x96 rectangle at position (9, 135).
; PLAN: r0=9(x), r1=135(y), r2=44(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 135
LDI r2, 44
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
