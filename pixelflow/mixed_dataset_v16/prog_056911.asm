; DESCRIPTION: Places a red line segment connecting (165, 188) to (169, 210).
; PLAN: r0=165(x1), r1=188(y1), r2=169(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 188
LDI r2, 169
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
