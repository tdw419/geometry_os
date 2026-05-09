; DESCRIPTION: Draws a purple line from (374, 150) to (265, 92).
; PLAN: r0=374(x1), r1=150(y1), r2=265(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 150
LDI r2, 265
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
