; DESCRIPTION: Draws a purple line from (9, 79) to (493, 5).
; PLAN: r0=9(x1), r1=79(y1), r2=493(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 79
LDI r2, 493
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
