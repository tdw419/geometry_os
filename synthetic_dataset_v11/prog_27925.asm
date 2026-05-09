; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (162, 101) with radius 50. Then Renders a magenta line between points (165, 173) and (50, 40).
; PLAN: r0=162(x), r1=101(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=165(x1), r1=173(y1), r2=50(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (162, 101) with radius 50.
; PLAN: r0=162(x), r1=101(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 101
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta line between points (165, 173) and (50, 40).
; PLAN: r0=165(x1), r1=173(y1), r2=50(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 173
LDI r2, 50
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
