; DESCRIPTION: Places a magenta line segment connecting (194, 129) to (300, 144).
; PLAN: r0=194(x1), r1=129(y1), r2=300(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 129
LDI r2, 300
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
