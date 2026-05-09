; DESCRIPTION: Draws a magenta line from (363, 161) to (264, 168).
; PLAN: r0=363(x1), r1=161(y1), r2=264(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 161
LDI r2, 264
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
