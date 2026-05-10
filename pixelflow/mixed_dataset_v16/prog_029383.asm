; DESCRIPTION: Draws a blue line from (169, 130) to (452, 115).
; PLAN: r0=169(x1), r1=130(y1), r2=452(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 130
LDI r2, 452
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
