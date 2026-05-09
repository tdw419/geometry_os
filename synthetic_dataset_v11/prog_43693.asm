; DESCRIPTION: Composite: . Then Places a magenta dot at position (49, 106). Then Draws a orange line from (137, 12) to (124, 56).
; PLAN: r0=49(x), r1=106(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=137(x1), r1=12(y1), r2=124(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (49, 106).
; PLAN: r0=49(x), r1=106(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 106
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a orange line from (137, 12) to (124, 56).
; PLAN: r0=137(x1), r1=12(y1), r2=124(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 12
LDI r2, 124
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
