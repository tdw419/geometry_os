; DESCRIPTION: Draws a magenta line from (249, 111) to (15, 162).
; PLAN: r0=249(x1), r1=111(y1), r2=15(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 111
LDI r2, 15
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
