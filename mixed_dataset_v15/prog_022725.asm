; DESCRIPTION: Draws a magenta line from (234, 205) to (370, 216).
; PLAN: r0=234(x1), r1=205(y1), r2=370(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 205
LDI r2, 370
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
