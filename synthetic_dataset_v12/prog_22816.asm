; DESCRIPTION: Draws a magenta line from (486, 150) to (481, 93).
; PLAN: r0=486(x1), r1=150(y1), r2=481(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 150
LDI r2, 481
LDI r3, 93
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
