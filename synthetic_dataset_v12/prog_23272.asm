; DESCRIPTION: Places a magenta line segment connecting (400, 38) to (198, 129).
; PLAN: r0=400(x1), r1=38(y1), r2=198(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 38
LDI r2, 198
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
