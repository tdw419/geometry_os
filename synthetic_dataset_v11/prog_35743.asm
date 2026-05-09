; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (229, 39) with radius 22. Then Draws a red line from (148, 71) to (138, 89).
; PLAN: r0=229(x), r1=39(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=148(x1), r1=71(y1), r2=138(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (229, 39) with radius 22.
; PLAN: r0=229(x), r1=39(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 39
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red line from (148, 71) to (138, 89).
; PLAN: r0=148(x1), r1=71(y1), r2=138(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 71
LDI r2, 138
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
