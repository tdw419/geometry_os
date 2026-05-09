; DESCRIPTION: Places a white line segment connecting (82, 123) to (63, 79).
; PLAN: r0=82(x1), r1=123(y1), r2=63(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 123
LDI r2, 63
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
