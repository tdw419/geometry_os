; DESCRIPTION: Renders a blue line between points (21, 91) and (196, 2).
; PLAN: r0=21(x1), r1=91(y1), r2=196(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 91
LDI r2, 196
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
