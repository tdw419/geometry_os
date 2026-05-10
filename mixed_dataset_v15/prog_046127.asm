; DESCRIPTION: Draws a magenta line from (185, 218) to (157, 236).
; PLAN: r0=185(x1), r1=218(y1), r2=157(x2), r3=236(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 218
LDI r2, 157
LDI r3, 236
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
