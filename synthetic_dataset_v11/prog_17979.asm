; DESCRIPTION: Composite: . Then Draws a magenta line from (14, 148) to (63, 204). Then Places a red dot at position (170, 199).
; PLAN: r0=14(x1), r1=148(y1), r2=63(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=170(x), r1=199(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta line from (14, 148) to (63, 204).
; PLAN: r0=14(x1), r1=148(y1), r2=63(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 148
LDI r2, 63
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (170, 199).
; PLAN: r0=170(x), r1=199(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 199
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
