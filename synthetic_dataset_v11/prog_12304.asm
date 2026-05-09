; DESCRIPTION: Draws a purple line from (154, 17) to (188, 241).
; PLAN: r0=154(x1), r1=17(y1), r2=188(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 17
LDI r2, 188
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
