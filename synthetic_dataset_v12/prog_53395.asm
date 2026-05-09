; DESCRIPTION: Draws a purple line from (264, 96) to (277, 40).
; PLAN: r0=264(x1), r1=96(y1), r2=277(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 96
LDI r2, 277
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
