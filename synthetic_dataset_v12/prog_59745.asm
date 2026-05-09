; DESCRIPTION: Draws a magenta line from (438, 117) to (13, 177).
; PLAN: r0=438(x1), r1=117(y1), r2=13(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 117
LDI r2, 13
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
