; DESCRIPTION: Draws a magenta line from (103, 29) to (483, 199).
; PLAN: r0=103(x1), r1=29(y1), r2=483(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 29
LDI r2, 483
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
