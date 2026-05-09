; DESCRIPTION: Draws a magenta line from (260, 174) to (178, 45).
; PLAN: r0=260(x1), r1=174(y1), r2=178(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 174
LDI r2, 178
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
