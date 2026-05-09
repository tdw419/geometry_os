; DESCRIPTION: Places a green line segment connecting (305, 229) to (125, 185).
; PLAN: r0=305(x1), r1=229(y1), r2=125(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 229
LDI r2, 125
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
