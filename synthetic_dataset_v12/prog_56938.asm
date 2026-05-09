; DESCRIPTION: Places a magenta line segment connecting (278, 127) to (334, 202).
; PLAN: r0=278(x1), r1=127(y1), r2=334(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 127
LDI r2, 334
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
