; DESCRIPTION: Draws a magenta line from (24, 216) to (245, 71).
; PLAN: r0=24(x1), r1=216(y1), r2=245(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 216
LDI r2, 245
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
