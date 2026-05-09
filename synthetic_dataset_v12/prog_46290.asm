; DESCRIPTION: Places a magenta line segment connecting (180, 218) to (34, 143).
; PLAN: r0=180(x1), r1=218(y1), r2=34(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 218
LDI r2, 34
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
