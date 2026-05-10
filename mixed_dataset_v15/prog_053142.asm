; DESCRIPTION: Places a magenta line segment connecting (279, 247) to (47, 83).
; PLAN: r0=279(x1), r1=247(y1), r2=47(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 247
LDI r2, 47
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
