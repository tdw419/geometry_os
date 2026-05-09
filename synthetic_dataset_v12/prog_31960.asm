; DESCRIPTION: Renders a blue line between points (220, 30) and (4, 52).
; PLAN: r0=220(x1), r1=30(y1), r2=4(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 30
LDI r2, 4
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
