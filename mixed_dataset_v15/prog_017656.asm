; DESCRIPTION: Draws a purple line from (306, 254) to (350, 50).
; PLAN: r0=306(x1), r1=254(y1), r2=350(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 254
LDI r2, 350
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
