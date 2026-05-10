; DESCRIPTION: Places a magenta line segment connecting (144, 129) to (119, 230).
; PLAN: r0=144(x1), r1=129(y1), r2=119(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 129
LDI r2, 119
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
