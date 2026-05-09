; DESCRIPTION: Places a magenta line segment connecting (237, 85) to (90, 122).
; PLAN: r0=237(x1), r1=85(y1), r2=90(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 85
LDI r2, 90
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
