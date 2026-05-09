; DESCRIPTION: Draws a purple line from (55, 44) to (134, 231).
; PLAN: r0=55(x1), r1=44(y1), r2=134(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 44
LDI r2, 134
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
