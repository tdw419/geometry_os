; DESCRIPTION: Draws a magenta line from (303, 179) to (462, 19).
; PLAN: r0=303(x1), r1=179(y1), r2=462(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 179
LDI r2, 462
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
