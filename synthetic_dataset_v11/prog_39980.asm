; DESCRIPTION: Draws a magenta line from (99, 8) to (171, 118).
; PLAN: r0=99(x1), r1=8(y1), r2=171(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 8
LDI r2, 171
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
