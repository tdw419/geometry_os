; DESCRIPTION: Places a black line segment connecting (480, 6) to (478, 150).
; PLAN: r0=480(x1), r1=6(y1), r2=478(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 6
LDI r2, 478
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
