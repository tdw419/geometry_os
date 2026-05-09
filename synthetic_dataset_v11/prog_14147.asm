; DESCRIPTION: Places a magenta line segment connecting (26, 120) to (39, 31).
; PLAN: r0=26(x1), r1=120(y1), r2=39(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 120
LDI r2, 39
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
