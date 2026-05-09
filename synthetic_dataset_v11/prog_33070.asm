; DESCRIPTION: Composite: . Then Renders a purple disk with center (81, 53) and radius 47. Then Draws a yellow rectangle at (73, 70) with width 97 and height 16.
; PLAN: r0=81(x), r1=53(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=73(x), r1=70(y), r2=97(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (81, 53) and radius 47.
; PLAN: r0=81(x), r1=53(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 53
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow rectangle at (73, 70) with width 97 and height 16.
; PLAN: r0=73(x), r1=70(y), r2=97(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 70
LDI r2, 97
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
