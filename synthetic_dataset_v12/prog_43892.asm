; DESCRIPTION: Draws a purple line from (162, 208) to (108, 24).
; PLAN: r0=162(x1), r1=208(y1), r2=108(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 208
LDI r2, 108
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
