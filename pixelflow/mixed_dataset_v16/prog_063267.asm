; DESCRIPTION: Draws a purple line from (386, 6) to (200, 37).
; PLAN: r0=386(x1), r1=6(y1), r2=200(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 6
LDI r2, 200
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
