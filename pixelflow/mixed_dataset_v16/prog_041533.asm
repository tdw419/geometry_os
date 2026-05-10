; DESCRIPTION: Draws a magenta line from (391, 123) to (280, 7).
; PLAN: r0=391(x1), r1=123(y1), r2=280(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 123
LDI r2, 280
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
