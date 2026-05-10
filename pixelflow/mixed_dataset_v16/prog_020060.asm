; DESCRIPTION: Draws a magenta line from (179, 216) to (407, 55).
; PLAN: r0=179(x1), r1=216(y1), r2=407(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 216
LDI r2, 407
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
