; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (54, 153) with width 74 and height 34. Then Renders a purple disk with center (72, 72) and radius 57.
; PLAN: r0=54(x), r1=153(y), r2=74(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=72(x), r1=72(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta rectangle at (54, 153) with width 74 and height 34.
; PLAN: r0=54(x), r1=153(y), r2=74(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 153
LDI r2, 74
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (72, 72) and radius 57.
; PLAN: r0=72(x), r1=72(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 72
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
