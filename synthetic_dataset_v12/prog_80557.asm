; DESCRIPTION: Draws a magenta line from (234, 147) to (2, 236).
; PLAN: r0=234(x1), r1=147(y1), r2=2(x2), r3=236(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 147
LDI r2, 2
LDI r3, 236
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
