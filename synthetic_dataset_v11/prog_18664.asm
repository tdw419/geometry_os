; DESCRIPTION: Places a magenta line segment connecting (198, 113) to (124, 68).
; PLAN: r0=198(x1), r1=113(y1), r2=124(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 113
LDI r2, 124
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
