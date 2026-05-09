; DESCRIPTION: Places a magenta line segment connecting (206, 33) to (100, 38).
; PLAN: r0=206(x1), r1=33(y1), r2=100(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 33
LDI r2, 100
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
