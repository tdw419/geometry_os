; DESCRIPTION: Places a magenta line segment connecting (260, 233) to (510, 50).
; PLAN: r0=260(x1), r1=233(y1), r2=510(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 233
LDI r2, 510
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
