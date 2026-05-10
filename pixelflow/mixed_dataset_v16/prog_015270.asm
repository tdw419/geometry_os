; DESCRIPTION: Renders a purple line segment connecting (340, 127) to (125, 69).
; PLAN: r0=340(x1), r1=127(y1), r2=125(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 127
LDI r2, 125
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
