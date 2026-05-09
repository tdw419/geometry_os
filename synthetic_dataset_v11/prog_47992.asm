; DESCRIPTION: Composite: . Then Draws a yellow line from (147, 118) to (38, 247). Then Places a magenta dot at position (142, 87).
; PLAN: r0=147(x1), r1=118(y1), r2=38(x2), r3=247(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=142(x), r1=87(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow line from (147, 118) to (38, 247).
; PLAN: r0=147(x1), r1=118(y1), r2=38(x2), r3=247(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 118
LDI r2, 38
LDI r3, 247
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (142, 87).
; PLAN: r0=142(x), r1=87(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 142
LDI r1, 87
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
