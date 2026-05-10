; DESCRIPTION: Renders a blue line between points (91, 51) and (391, 138).
; PLAN: r0=91(x1), r1=51(y1), r2=391(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 51
LDI r2, 391
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
