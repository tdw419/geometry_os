; DESCRIPTION: Places a purple line segment connecting (69, 243) to (212, 25).
; PLAN: r0=69(x1), r1=243(y1), r2=212(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 243
LDI r2, 212
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
