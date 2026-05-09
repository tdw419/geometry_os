; DESCRIPTION: Draws a magenta line from (26, 79) to (88, 142).
; PLAN: r0=26(x1), r1=79(y1), r2=88(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 79
LDI r2, 88
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
