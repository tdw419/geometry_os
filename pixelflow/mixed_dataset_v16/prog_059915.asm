; DESCRIPTION: Places a magenta line segment connecting (180, 125) to (351, 0).
; PLAN: r0=180(x1), r1=125(y1), r2=351(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 125
LDI r2, 351
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
