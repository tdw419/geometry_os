; DESCRIPTION: Renders a purple line segment connecting (198, 185) to (370, 46).
; PLAN: r0=198(x1), r1=185(y1), r2=370(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 185
LDI r2, 370
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
