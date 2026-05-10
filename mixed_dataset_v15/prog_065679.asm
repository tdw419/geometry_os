; DESCRIPTION: Places a purple line segment connecting (154, 113) to (9, 184).
; PLAN: r0=154(x1), r1=113(y1), r2=9(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 113
LDI r2, 9
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
