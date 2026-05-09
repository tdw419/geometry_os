; DESCRIPTION: Draws a blue line from (191, 210) to (101, 221).
; PLAN: r0=191(x1), r1=210(y1), r2=101(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 210
LDI r2, 101
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
