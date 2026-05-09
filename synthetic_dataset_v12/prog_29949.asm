; DESCRIPTION: Places a magenta line segment connecting (300, 207) to (199, 14).
; PLAN: r0=300(x1), r1=207(y1), r2=199(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 207
LDI r2, 199
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
