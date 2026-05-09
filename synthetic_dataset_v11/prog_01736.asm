; DESCRIPTION: Places a blue line segment connecting (112, 146) to (198, 101).
; PLAN: r0=112(x1), r1=146(y1), r2=198(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 146
LDI r2, 198
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
