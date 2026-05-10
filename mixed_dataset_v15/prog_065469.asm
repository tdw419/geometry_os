; DESCRIPTION: Places a purple line segment connecting (277, 174) to (292, 6).
; PLAN: r0=277(x1), r1=174(y1), r2=292(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 174
LDI r2, 292
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
