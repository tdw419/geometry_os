; DESCRIPTION: Draws a purple line from (185, 108) to (52, 215).
; PLAN: r0=185(x1), r1=108(y1), r2=52(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 108
LDI r2, 52
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
