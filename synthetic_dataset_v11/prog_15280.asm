; DESCRIPTION: Places a orange line segment connecting (86, 212) to (35, 126).
; PLAN: r0=86(x1), r1=212(y1), r2=35(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 212
LDI r2, 35
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
