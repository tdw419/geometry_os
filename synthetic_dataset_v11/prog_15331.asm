; DESCRIPTION: Draws a magenta line from (251, 114) to (89, 117).
; PLAN: r0=251(x1), r1=114(y1), r2=89(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 114
LDI r2, 89
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
