; DESCRIPTION: Places a blue line segment connecting (112, 197) to (167, 142).
; PLAN: r0=112(x1), r1=197(y1), r2=167(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 197
LDI r2, 167
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
