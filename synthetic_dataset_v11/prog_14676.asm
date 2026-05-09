; DESCRIPTION: Composite: . Then Draws a blue line from (129, 150) to (158, 37). Then Creates a green circular shape at (145, 92) with radius 57.
; PLAN: r0=129(x1), r1=150(y1), r2=158(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=145(x), r1=92(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a blue line from (129, 150) to (158, 37).
; PLAN: r0=129(x1), r1=150(y1), r2=158(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 150
LDI r2, 158
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green circular shape at (145, 92) with radius 57.
; PLAN: r0=145(x), r1=92(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 92
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
