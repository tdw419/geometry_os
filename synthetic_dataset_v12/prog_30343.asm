; DESCRIPTION: Draws a magenta line from (438, 104) to (162, 126).
; PLAN: r0=438(x1), r1=104(y1), r2=162(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 104
LDI r2, 162
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
