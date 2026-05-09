; DESCRIPTION: Draws a magenta line from (110, 74) to (232, 47).
; PLAN: r0=110(x1), r1=74(y1), r2=232(x2), r3=47(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 74
LDI r2, 232
LDI r3, 47
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
