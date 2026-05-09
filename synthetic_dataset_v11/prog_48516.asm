; DESCRIPTION: Places a magenta line segment connecting (169, 128) to (210, 196).
; PLAN: r0=169(x1), r1=128(y1), r2=210(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 128
LDI r2, 210
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
