; DESCRIPTION: Draws a purple line from (332, 154) to (70, 165).
; PLAN: r0=332(x1), r1=154(y1), r2=70(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 154
LDI r2, 70
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
