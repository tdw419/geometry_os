; DESCRIPTION: Composite: . Then Places a blue circle of radius 70 at center (142, 97). Then Draws a cyan rectangle at (138, 43) with width 98 and height 119.
; PLAN: r0=142(x), r1=97(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=138(x), r1=43(y), r2=98(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue circle of radius 70 at center (142, 97).
; PLAN: r0=142(x), r1=97(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 97
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan rectangle at (138, 43) with width 98 and height 119.
; PLAN: r0=138(x), r1=43(y), r2=98(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 43
LDI r2, 98
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
