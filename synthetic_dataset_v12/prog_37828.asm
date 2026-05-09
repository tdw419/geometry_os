; DESCRIPTION: Draws a purple line from (272, 50) to (342, 150).
; PLAN: r0=272(x1), r1=50(y1), r2=342(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 50
LDI r2, 342
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
