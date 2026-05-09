; DESCRIPTION: Places a orange line segment connecting (107, 150) to (247, 132).
; PLAN: r0=107(x1), r1=150(y1), r2=247(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 150
LDI r2, 247
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
