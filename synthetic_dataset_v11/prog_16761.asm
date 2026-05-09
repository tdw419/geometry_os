; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (187, 166). Then Draws a blue line from (141, 44) to (216, 119).
; PLAN: r0=187(x), r1=166(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=141(x1), r1=44(y1), r2=216(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (187, 166).
; PLAN: r0=187(x), r1=166(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 187
LDI r1, 166
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a blue line from (141, 44) to (216, 119).
; PLAN: r0=141(x1), r1=44(y1), r2=216(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 44
LDI r2, 216
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
