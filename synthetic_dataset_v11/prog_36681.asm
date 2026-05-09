; DESCRIPTION: Composite: . Then Draws a orange line from (74, 130) to (135, 159). Then Renders a red disk with center (96, 101) and radius 79.
; PLAN: r0=74(x1), r1=130(y1), r2=135(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=96(x), r1=101(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange line from (74, 130) to (135, 159).
; PLAN: r0=74(x1), r1=130(y1), r2=135(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 130
LDI r2, 135
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (96, 101) and radius 79.
; PLAN: r0=96(x), r1=101(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 101
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
