; DESCRIPTION: Places a orange line segment connecting (74, 229) to (119, 215).
; PLAN: r0=74(x1), r1=229(y1), r2=119(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 229
LDI r2, 119
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
