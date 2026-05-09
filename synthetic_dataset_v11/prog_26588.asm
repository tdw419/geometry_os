; DESCRIPTION: Composite: . Then Draws a purple circle centered at (47, 59) with radius 34. Then Places a magenta line segment connecting (73, 51) to (61, 32).
; PLAN: r0=47(x), r1=59(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=73(x1), r1=51(y1), r2=61(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple circle centered at (47, 59) with radius 34.
; PLAN: r0=47(x), r1=59(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 59
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta line segment connecting (73, 51) to (61, 32).
; PLAN: r0=73(x1), r1=51(y1), r2=61(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 51
LDI r2, 61
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
