; DESCRIPTION: Places a green line segment connecting (278, 229) to (120, 149).
; PLAN: r0=278(x1), r1=229(y1), r2=120(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 229
LDI r2, 120
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
