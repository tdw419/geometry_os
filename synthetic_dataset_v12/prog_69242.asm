; DESCRIPTION: Places a magenta line segment connecting (10, 202) to (226, 234).
; PLAN: r0=10(x1), r1=202(y1), r2=226(x2), r3=234(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 202
LDI r2, 226
LDI r3, 234
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
