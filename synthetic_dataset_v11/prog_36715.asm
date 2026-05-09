; DESCRIPTION: Places a magenta line segment connecting (120, 233) to (87, 168).
; PLAN: r0=120(x1), r1=233(y1), r2=87(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 233
LDI r2, 87
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
