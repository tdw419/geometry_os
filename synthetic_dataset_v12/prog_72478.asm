; DESCRIPTION: Draws a magenta line from (420, 146) to (158, 150).
; PLAN: r0=420(x1), r1=146(y1), r2=158(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 146
LDI r2, 158
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
