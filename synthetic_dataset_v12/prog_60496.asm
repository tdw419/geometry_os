; DESCRIPTION: Places a white line segment connecting (219, 212) to (407, 146).
; PLAN: r0=219(x1), r1=212(y1), r2=407(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 212
LDI r2, 407
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
