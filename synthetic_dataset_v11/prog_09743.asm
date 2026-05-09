; DESCRIPTION: Draws a purple line from (251, 123) to (168, 127).
; PLAN: r0=251(x1), r1=123(y1), r2=168(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 123
LDI r2, 168
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
