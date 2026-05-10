; DESCRIPTION: Draws a magenta line from (259, 37) to (259, 118).
; PLAN: r0=259(x1), r1=37(y1), r2=259(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 37
LDI r2, 259
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
