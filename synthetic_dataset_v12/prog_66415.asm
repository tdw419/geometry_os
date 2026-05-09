; DESCRIPTION: Draws a magenta line from (250, 124) to (389, 221).
; PLAN: r0=250(x1), r1=124(y1), r2=389(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 124
LDI r2, 389
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
