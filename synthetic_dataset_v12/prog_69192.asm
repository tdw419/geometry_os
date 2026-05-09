; DESCRIPTION: Draws a magenta line from (171, 110) to (126, 169).
; PLAN: r0=171(x1), r1=110(y1), r2=126(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 110
LDI r2, 126
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
