; DESCRIPTION: Places a white line segment connecting (63, 133) to (461, 28).
; PLAN: r0=63(x1), r1=133(y1), r2=461(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 133
LDI r2, 461
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
