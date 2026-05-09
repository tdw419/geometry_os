; DESCRIPTION: Places a magenta line segment connecting (4, 129) to (61, 206).
; PLAN: r0=4(x1), r1=129(y1), r2=61(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 129
LDI r2, 61
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
