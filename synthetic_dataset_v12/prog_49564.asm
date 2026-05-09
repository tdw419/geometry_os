; DESCRIPTION: Draws a magenta line from (216, 71) to (330, 247).
; PLAN: r0=216(x1), r1=71(y1), r2=330(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 71
LDI r2, 330
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
