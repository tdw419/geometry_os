; DESCRIPTION: Places a magenta line segment connecting (299, 94) to (509, 133).
; PLAN: r0=299(x1), r1=94(y1), r2=509(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 94
LDI r2, 509
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
