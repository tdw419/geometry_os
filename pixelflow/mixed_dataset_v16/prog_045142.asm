; DESCRIPTION: Draws a blue line from (8, 212) to (443, 233).
; PLAN: r0=8(x1), r1=212(y1), r2=443(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 212
LDI r2, 443
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
