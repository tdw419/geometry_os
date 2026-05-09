; DESCRIPTION: Composite: . Then Renders a magenta line between points (22, 220) and (96, 22). Then Draws a yellow circle centered at (162, 160) with radius 15.
; PLAN: r0=22(x1), r1=220(y1), r2=96(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=162(x), r1=160(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta line between points (22, 220) and (96, 22).
; PLAN: r0=22(x1), r1=220(y1), r2=96(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 220
LDI r2, 96
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (162, 160) with radius 15.
; PLAN: r0=162(x), r1=160(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 160
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
