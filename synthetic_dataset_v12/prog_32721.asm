; DESCRIPTION: Draws a magenta line from (52, 127) to (391, 158).
; PLAN: r0=52(x1), r1=127(y1), r2=391(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 127
LDI r2, 391
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
