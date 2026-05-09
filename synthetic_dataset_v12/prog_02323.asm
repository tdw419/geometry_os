; DESCRIPTION: Places a black line segment connecting (278, 39) to (250, 14).
; PLAN: r0=278(x1), r1=39(y1), r2=250(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 39
LDI r2, 250
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
