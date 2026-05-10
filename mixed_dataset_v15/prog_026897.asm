; DESCRIPTION: Draws a magenta line from (36, 118) to (499, 178).
; PLAN: r0=36(x1), r1=118(y1), r2=499(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 118
LDI r2, 499
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
