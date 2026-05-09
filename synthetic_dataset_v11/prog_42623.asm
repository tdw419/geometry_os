; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (7, 206) with width 40 and height 44. Then Renders a blue disk with center (75, 77) and radius 54.
; PLAN: r0=7(x), r1=206(y), r2=40(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=75(x), r1=77(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta rectangle at (7, 206) with width 40 and height 44.
; PLAN: r0=7(x), r1=206(y), r2=40(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 206
LDI r2, 40
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue disk with center (75, 77) and radius 54.
; PLAN: r0=75(x), r1=77(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 77
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
