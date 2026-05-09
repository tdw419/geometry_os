; DESCRIPTION: Places a magenta line segment connecting (103, 74) to (129, 87).
; PLAN: r0=103(x1), r1=74(y1), r2=129(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 74
LDI r2, 129
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
