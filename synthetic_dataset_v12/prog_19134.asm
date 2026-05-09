; DESCRIPTION: Renders a blue line between points (162, 237) and (35, 207).
; PLAN: r0=162(x1), r1=237(y1), r2=35(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 237
LDI r2, 35
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
