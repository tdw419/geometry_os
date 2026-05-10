; DESCRIPTION: Renders a blue line segment connecting (223, 104) to (358, 152).
; PLAN: r0=223(x1), r1=104(y1), r2=358(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 104
LDI r2, 358
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
