; DESCRIPTION: Draws a purple line from (193, 64) to (207, 80).
; PLAN: r0=193(x1), r1=64(y1), r2=207(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 64
LDI r2, 207
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
