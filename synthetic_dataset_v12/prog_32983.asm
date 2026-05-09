; DESCRIPTION: Places a blue line segment connecting (413, 177) to (296, 7).
; PLAN: r0=413(x1), r1=177(y1), r2=296(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 177
LDI r2, 296
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
