; DESCRIPTION: Renders a blue line between points (362, 40) and (220, 62).
; PLAN: r0=362(x1), r1=40(y1), r2=220(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 40
LDI r2, 220
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
