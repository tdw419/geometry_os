; DESCRIPTION: Places a red line segment connecting (72, 15) to (86, 132).
; PLAN: r0=72(x1), r1=15(y1), r2=86(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 15
LDI r2, 86
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
