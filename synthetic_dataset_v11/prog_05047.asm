; DESCRIPTION: Places a orange line segment connecting (158, 45) to (107, 215).
; PLAN: r0=158(x1), r1=45(y1), r2=107(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 45
LDI r2, 107
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
