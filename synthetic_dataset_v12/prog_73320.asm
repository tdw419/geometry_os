; DESCRIPTION: Places a magenta line segment connecting (90, 151) to (364, 160).
; PLAN: r0=90(x1), r1=151(y1), r2=364(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 151
LDI r2, 364
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
