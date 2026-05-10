; DESCRIPTION: Draws a magenta line from (355, 16) to (89, 138).
; PLAN: r0=355(x1), r1=16(y1), r2=89(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 16
LDI r2, 89
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
