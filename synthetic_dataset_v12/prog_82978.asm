; DESCRIPTION: Draws a magenta line from (107, 90) to (465, 85).
; PLAN: r0=107(x1), r1=90(y1), r2=465(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 90
LDI r2, 465
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
