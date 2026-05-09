; DESCRIPTION: Places a magenta line segment connecting (150, 53) to (76, 184).
; PLAN: r0=150(x1), r1=53(y1), r2=76(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 53
LDI r2, 76
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
