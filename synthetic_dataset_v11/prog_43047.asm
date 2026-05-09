; DESCRIPTION: Places a magenta line segment connecting (219, 251) to (82, 60).
; PLAN: r0=219(x1), r1=251(y1), r2=82(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 251
LDI r2, 82
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
