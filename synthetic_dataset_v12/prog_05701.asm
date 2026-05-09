; DESCRIPTION: Draws a purple line from (331, 129) to (350, 217).
; PLAN: r0=331(x1), r1=129(y1), r2=350(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 129
LDI r2, 350
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
