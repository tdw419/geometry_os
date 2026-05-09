; DESCRIPTION: Renders a blue line between points (99, 153) and (362, 226).
; PLAN: r0=99(x1), r1=153(y1), r2=362(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 153
LDI r2, 362
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
