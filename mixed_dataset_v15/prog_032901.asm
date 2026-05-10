; DESCRIPTION: Places a magenta line segment connecting (48, 208) to (315, 50).
; PLAN: r0=48(x1), r1=208(y1), r2=315(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 208
LDI r2, 315
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
