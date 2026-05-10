; DESCRIPTION: Places a magenta line segment connecting (259, 60) to (307, 200).
; PLAN: r0=259(x1), r1=60(y1), r2=307(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 60
LDI r2, 307
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
