; DESCRIPTION: Draws a purple line from (433, 158) to (470, 236).
; PLAN: r0=433(x1), r1=158(y1), r2=470(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 158
LDI r2, 470
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
