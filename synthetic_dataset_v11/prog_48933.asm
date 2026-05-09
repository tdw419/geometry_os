; DESCRIPTION: Composite: . Then Draws a orange line from (79, 148) to (56, 163). Then Places a purple dot at position (225, 169).
; PLAN: r0=79(x1), r1=148(y1), r2=56(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=225(x), r1=169(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange line from (79, 148) to (56, 163).
; PLAN: r0=79(x1), r1=148(y1), r2=56(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 148
LDI r2, 56
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (225, 169).
; PLAN: r0=225(x), r1=169(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 225
LDI r1, 169
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
