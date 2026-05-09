; DESCRIPTION: Places a cyan line segment connecting (201, 133) to (85, 189).
; PLAN: r0=201(x1), r1=133(y1), r2=85(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 133
LDI r2, 85
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
