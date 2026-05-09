; DESCRIPTION: Composite: . Then Draws a purple circle centered at (165, 144) with radius 70. Then Places a orange line segment connecting (196, 163) to (202, 81).
; PLAN: r0=165(x), r1=144(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=196(x1), r1=163(y1), r2=202(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple circle centered at (165, 144) with radius 70.
; PLAN: r0=165(x), r1=144(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 144
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange line segment connecting (196, 163) to (202, 81).
; PLAN: r0=196(x1), r1=163(y1), r2=202(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 163
LDI r2, 202
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
