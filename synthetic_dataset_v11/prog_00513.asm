; DESCRIPTION: Draws a purple line from (87, 56) to (164, 220).
; PLAN: r0=87(x1), r1=56(y1), r2=164(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 56
LDI r2, 164
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
