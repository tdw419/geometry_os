; DESCRIPTION: Places a blue line segment connecting (492, 50) to (52, 112).
; PLAN: r0=492(x1), r1=50(y1), r2=52(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 50
LDI r2, 52
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
