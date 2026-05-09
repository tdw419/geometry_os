; DESCRIPTION: Places a magenta line segment connecting (296, 72) to (120, 81).
; PLAN: r0=296(x1), r1=72(y1), r2=120(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 72
LDI r2, 120
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
