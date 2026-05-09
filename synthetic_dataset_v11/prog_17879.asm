; DESCRIPTION: Renders a blue line between points (166, 207) and (112, 220).
; PLAN: r0=166(x1), r1=207(y1), r2=112(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 207
LDI r2, 112
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
