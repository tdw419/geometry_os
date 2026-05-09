; DESCRIPTION: Draws a magenta line from (38, 174) to (75, 4).
; PLAN: r0=38(x1), r1=174(y1), r2=75(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 174
LDI r2, 75
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
