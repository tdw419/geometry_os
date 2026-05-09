; DESCRIPTION: Draws a purple line from (149, 180) to (206, 56).
; PLAN: r0=149(x1), r1=180(y1), r2=206(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 180
LDI r2, 206
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
