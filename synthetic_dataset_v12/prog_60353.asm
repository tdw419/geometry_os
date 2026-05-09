; DESCRIPTION: Draws a purple line from (35, 129) to (385, 222).
; PLAN: r0=35(x1), r1=129(y1), r2=385(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 129
LDI r2, 385
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
