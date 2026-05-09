; DESCRIPTION: Places a purple line segment connecting (121, 112) to (198, 138).
; PLAN: r0=121(x1), r1=112(y1), r2=198(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 112
LDI r2, 198
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
