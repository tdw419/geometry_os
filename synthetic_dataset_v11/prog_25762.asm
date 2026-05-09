; DESCRIPTION: Draws a magenta line from (170, 60) to (212, 229).
; PLAN: r0=170(x1), r1=60(y1), r2=212(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 60
LDI r2, 212
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
