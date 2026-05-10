; DESCRIPTION: Draws a purple line from (22, 95) to (330, 86).
; PLAN: r0=22(x1), r1=95(y1), r2=330(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 95
LDI r2, 330
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
