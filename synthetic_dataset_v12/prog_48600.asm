; DESCRIPTION: Places a black line segment connecting (392, 145) to (198, 122).
; PLAN: r0=392(x1), r1=145(y1), r2=198(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 145
LDI r2, 198
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
