; DESCRIPTION: Places a green line segment connecting (117, 85) to (96, 150).
; PLAN: r0=117(x1), r1=85(y1), r2=96(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 85
LDI r2, 96
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
