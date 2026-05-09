; DESCRIPTION: Places a purple line segment connecting (20, 161) to (63, 134).
; PLAN: r0=20(x1), r1=161(y1), r2=63(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 161
LDI r2, 63
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
