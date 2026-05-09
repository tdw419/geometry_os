; DESCRIPTION: Renders a blue line between points (91, 19) and (36, 243).
; PLAN: r0=91(x1), r1=19(y1), r2=36(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 19
LDI r2, 36
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
