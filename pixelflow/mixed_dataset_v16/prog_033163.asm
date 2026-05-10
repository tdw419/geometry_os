; DESCRIPTION: Renders a blue line segment connecting (118, 19) to (273, 166).
; PLAN: r0=118(x1), r1=19(y1), r2=273(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 19
LDI r2, 273
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
