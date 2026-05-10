; DESCRIPTION: Draws a purple line from (180, 20) to (409, 162).
; PLAN: r0=180(x1), r1=20(y1), r2=409(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 20
LDI r2, 409
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
