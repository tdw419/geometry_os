; DESCRIPTION: Places a magenta line segment connecting (359, 12) to (251, 246).
; PLAN: r0=359(x1), r1=12(y1), r2=251(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 12
LDI r2, 251
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
