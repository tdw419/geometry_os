; DESCRIPTION: Draws a magenta line from (47, 52) to (161, 240).
; PLAN: r0=47(x1), r1=52(y1), r2=161(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 52
LDI r2, 161
LDI r3, 240
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
