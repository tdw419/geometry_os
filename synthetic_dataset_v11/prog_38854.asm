; DESCRIPTION: Composite: . Then Places a white line segment connecting (102, 165) to (57, 86). Then Draws a magenta circle centered at (169, 94) with radius 34.
; PLAN: r0=102(x1), r1=165(y1), r2=57(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=169(x), r1=94(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white line segment connecting (102, 165) to (57, 86).
; PLAN: r0=102(x1), r1=165(y1), r2=57(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 165
LDI r2, 57
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta circle centered at (169, 94) with radius 34.
; PLAN: r0=169(x), r1=94(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 94
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
