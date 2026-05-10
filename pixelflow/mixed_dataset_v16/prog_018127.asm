; DESCRIPTION: Draws a magenta line from (7, 131) to (60, 13).
; PLAN: r0=7(x1), r1=131(y1), r2=60(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 131
LDI r2, 60
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
