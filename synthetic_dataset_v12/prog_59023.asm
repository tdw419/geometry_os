; DESCRIPTION: Places a black line segment connecting (196, 75) to (133, 132).
; PLAN: r0=196(x1), r1=75(y1), r2=133(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 75
LDI r2, 133
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
