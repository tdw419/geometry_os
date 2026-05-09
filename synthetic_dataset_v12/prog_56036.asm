; DESCRIPTION: Places a black line segment connecting (139, 144) to (50, 132).
; PLAN: r0=139(x1), r1=144(y1), r2=50(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 144
LDI r2, 50
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
