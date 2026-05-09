; DESCRIPTION: Composite: . Then Places a orange circle of radius 26 at center (135, 136). Then Draws a blue line from (121, 135) to (151, 124).
; PLAN: r0=135(x), r1=136(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=121(x1), r1=135(y1), r2=151(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange circle of radius 26 at center (135, 136).
; PLAN: r0=135(x), r1=136(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 136
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue line from (121, 135) to (151, 124).
; PLAN: r0=121(x1), r1=135(y1), r2=151(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 135
LDI r2, 151
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
