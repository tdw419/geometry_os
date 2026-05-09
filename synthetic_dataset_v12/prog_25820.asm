; DESCRIPTION: Draws a blue line from (161, 150) to (209, 150).
; PLAN: r0=161(x1), r1=150(y1), r2=209(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 150
LDI r2, 209
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
