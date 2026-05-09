; DESCRIPTION: Draws a magenta line from (9, 49) to (229, 187).
; PLAN: r0=9(x1), r1=49(y1), r2=229(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 49
LDI r2, 229
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
