; DESCRIPTION: Places a magenta line segment connecting (184, 195) to (87, 122).
; PLAN: r0=184(x1), r1=195(y1), r2=87(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 195
LDI r2, 87
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
