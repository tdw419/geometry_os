; DESCRIPTION: Draws a magenta line from (216, 27) to (147, 195).
; PLAN: r0=216(x1), r1=27(y1), r2=147(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 27
LDI r2, 147
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
