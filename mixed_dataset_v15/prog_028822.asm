; DESCRIPTION: Draws a magenta line from (498, 131) to (355, 86).
; PLAN: r0=498(x1), r1=131(y1), r2=355(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 131
LDI r2, 355
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
