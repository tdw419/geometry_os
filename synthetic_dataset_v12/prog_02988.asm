; DESCRIPTION: Places a magenta line segment connecting (144, 170) to (174, 3).
; PLAN: r0=144(x1), r1=170(y1), r2=174(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 170
LDI r2, 174
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
