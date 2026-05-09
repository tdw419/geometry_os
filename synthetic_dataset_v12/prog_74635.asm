; DESCRIPTION: Draws a purple line from (162, 206) to (154, 165).
; PLAN: r0=162(x1), r1=206(y1), r2=154(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 206
LDI r2, 154
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
