; DESCRIPTION: Draws a magenta line from (158, 97) to (146, 168).
; PLAN: r0=158(x1), r1=97(y1), r2=146(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 97
LDI r2, 146
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
