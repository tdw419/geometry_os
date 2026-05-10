; DESCRIPTION: Draws a magenta line from (417, 227) to (252, 45).
; PLAN: r0=417(x1), r1=227(y1), r2=252(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 227
LDI r2, 252
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
