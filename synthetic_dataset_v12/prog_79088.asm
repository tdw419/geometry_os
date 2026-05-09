; DESCRIPTION: Places a black line segment connecting (263, 217) to (462, 150).
; PLAN: r0=263(x1), r1=217(y1), r2=462(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 217
LDI r2, 462
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
