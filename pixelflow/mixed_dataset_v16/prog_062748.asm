; DESCRIPTION: Places a magenta line segment connecting (140, 225) to (180, 57).
; PLAN: r0=140(x1), r1=225(y1), r2=180(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 225
LDI r2, 180
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
