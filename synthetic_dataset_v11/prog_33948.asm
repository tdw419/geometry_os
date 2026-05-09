; DESCRIPTION: Places a orange line segment connecting (140, 214) to (61, 126).
; PLAN: r0=140(x1), r1=214(y1), r2=61(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 214
LDI r2, 61
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
