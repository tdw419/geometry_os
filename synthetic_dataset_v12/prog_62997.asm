; DESCRIPTION: Draws a magenta line from (229, 57) to (73, 72).
; PLAN: r0=229(x1), r1=57(y1), r2=73(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 57
LDI r2, 73
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
