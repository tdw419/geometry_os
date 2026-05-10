; DESCRIPTION: Places a magenta line segment connecting (464, 65) to (184, 90).
; PLAN: r0=464(x1), r1=65(y1), r2=184(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 65
LDI r2, 184
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
