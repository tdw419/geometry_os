; DESCRIPTION: Places a green line segment connecting (169, 132) to (20, 177).
; PLAN: r0=169(x1), r1=132(y1), r2=20(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 132
LDI r2, 20
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
