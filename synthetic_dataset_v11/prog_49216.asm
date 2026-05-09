; DESCRIPTION: Draws a blue line from (141, 207) to (87, 208).
; PLAN: r0=141(x1), r1=207(y1), r2=87(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 207
LDI r2, 87
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
