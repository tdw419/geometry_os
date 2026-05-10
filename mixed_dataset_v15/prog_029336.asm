; DESCRIPTION: Draws a magenta line from (438, 69) to (462, 141).
; PLAN: r0=438(x1), r1=69(y1), r2=462(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 69
LDI r2, 462
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
