; DESCRIPTION: Places a magenta line segment connecting (495, 146) to (500, 155).
; PLAN: r0=495(x1), r1=146(y1), r2=500(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 146
LDI r2, 500
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
