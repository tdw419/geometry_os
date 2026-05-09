; DESCRIPTION: Places a magenta line segment connecting (60, 173) to (136, 211).
; PLAN: r0=60(x1), r1=173(y1), r2=136(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 173
LDI r2, 136
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
