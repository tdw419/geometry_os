; DESCRIPTION: Composite: . Then Renders a red line between points (44, 1) and (25, 8). Then Draws a magenta rectangle at (96, 40) with width 45 and height 20.
; PLAN: r0=44(x1), r1=1(y1), r2=25(x2), r3=8(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=96(x), r1=40(y), r2=45(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red line between points (44, 1) and (25, 8).
; PLAN: r0=44(x1), r1=1(y1), r2=25(x2), r3=8(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 1
LDI r2, 25
LDI r3, 8
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta rectangle at (96, 40) with width 45 and height 20.
; PLAN: r0=96(x), r1=40(y), r2=45(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 40
LDI r2, 45
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
