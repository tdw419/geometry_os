; DESCRIPTION: Places a magenta line segment connecting (252, 209) to (120, 140).
; PLAN: r0=252(x1), r1=209(y1), r2=120(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 209
LDI r2, 120
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
