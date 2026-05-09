; DESCRIPTION: Composite: . Then Places a magenta dot at position (49, 148). Then Draws a magenta line from (34, 113) to (118, 31).
; PLAN: r0=49(x), r1=148(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=34(x1), r1=113(y1), r2=118(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (49, 148).
; PLAN: r0=49(x), r1=148(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 148
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta line from (34, 113) to (118, 31).
; PLAN: r0=34(x1), r1=113(y1), r2=118(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 113
LDI r2, 118
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
