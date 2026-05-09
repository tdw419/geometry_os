; DESCRIPTION: Places a black line segment connecting (480, 60) to (193, 147).
; PLAN: r0=480(x1), r1=60(y1), r2=193(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 60
LDI r2, 193
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
