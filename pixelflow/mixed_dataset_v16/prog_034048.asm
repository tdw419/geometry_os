; DESCRIPTION: Draws a purple line from (470, 150) to (259, 62).
; PLAN: r0=470(x1), r1=150(y1), r2=259(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 150
LDI r2, 259
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
