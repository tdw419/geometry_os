; DESCRIPTION: Draws a purple line from (146, 88) to (127, 120).
; PLAN: r0=146(x1), r1=88(y1), r2=127(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 88
LDI r2, 127
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
