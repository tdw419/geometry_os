; DESCRIPTION: Draws a magenta line from (251, 229) to (229, 35).
; PLAN: r0=251(x1), r1=229(y1), r2=229(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 229
LDI r2, 229
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
