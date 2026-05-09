; DESCRIPTION: Places a magenta line segment connecting (210, 6) to (169, 113).
; PLAN: r0=210(x1), r1=6(y1), r2=169(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 6
LDI r2, 169
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
