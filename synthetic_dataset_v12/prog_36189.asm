; DESCRIPTION: Draws a blue line from (362, 194) to (231, 104).
; PLAN: r0=362(x1), r1=194(y1), r2=231(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 194
LDI r2, 231
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
