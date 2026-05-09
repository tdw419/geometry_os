; DESCRIPTION: Places a white line segment connecting (211, 168) to (82, 80).
; PLAN: r0=211(x1), r1=168(y1), r2=82(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 168
LDI r2, 82
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
