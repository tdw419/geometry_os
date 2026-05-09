; DESCRIPTION: Places a white line segment connecting (333, 79) to (2, 212).
; PLAN: r0=333(x1), r1=79(y1), r2=2(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 79
LDI r2, 2
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
