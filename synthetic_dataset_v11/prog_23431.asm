; DESCRIPTION: Draws a magenta line from (229, 205) to (176, 110).
; PLAN: r0=229(x1), r1=205(y1), r2=176(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 205
LDI r2, 176
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
