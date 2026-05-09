; DESCRIPTION: Draws a blue line from (216, 177) to (58, 50).
; PLAN: r0=216(x1), r1=177(y1), r2=58(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 177
LDI r2, 58
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
