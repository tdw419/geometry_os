; DESCRIPTION: Draws a magenta line from (55, 176) to (229, 221).
; PLAN: r0=55(x1), r1=176(y1), r2=229(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 176
LDI r2, 229
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
