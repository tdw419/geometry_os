; DESCRIPTION: Places a black line segment connecting (265, 162) to (10, 132).
; PLAN: r0=265(x1), r1=162(y1), r2=10(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 162
LDI r2, 10
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
