; DESCRIPTION: Draws a blue line from (467, 118) to (138, 190).
; PLAN: r0=467(x1), r1=118(y1), r2=138(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 118
LDI r2, 138
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
