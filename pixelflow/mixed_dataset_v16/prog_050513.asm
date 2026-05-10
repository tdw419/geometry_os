; DESCRIPTION: Draws a blue line from (433, 158) to (405, 47).
; PLAN: r0=433(x1), r1=158(y1), r2=405(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 158
LDI r2, 405
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
