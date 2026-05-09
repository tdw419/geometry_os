; DESCRIPTION: Draws a magenta line from (229, 192) to (10, 164).
; PLAN: r0=229(x1), r1=192(y1), r2=10(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 192
LDI r2, 10
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
