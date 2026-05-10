; DESCRIPTION: Places a magenta line segment connecting (352, 145) to (448, 243).
; PLAN: r0=352(x1), r1=145(y1), r2=448(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 145
LDI r2, 448
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
