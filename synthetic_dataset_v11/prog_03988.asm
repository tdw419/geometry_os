; DESCRIPTION: Draws a purple line from (162, 222) to (154, 142).
; PLAN: r0=162(x1), r1=222(y1), r2=154(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 222
LDI r2, 154
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
