; DESCRIPTION: Places a black line segment connecting (392, 180) to (465, 105).
; PLAN: r0=392(x1), r1=180(y1), r2=465(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 180
LDI r2, 465
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
