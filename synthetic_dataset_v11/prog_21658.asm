; DESCRIPTION: Places a magenta line segment connecting (110, 171) to (81, 96).
; PLAN: r0=110(x1), r1=171(y1), r2=81(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 171
LDI r2, 81
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
