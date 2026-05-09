; DESCRIPTION: Renders a blue line between points (196, 145) and (68, 240).
; PLAN: r0=196(x1), r1=145(y1), r2=68(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 145
LDI r2, 68
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
