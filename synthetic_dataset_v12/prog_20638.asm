; DESCRIPTION: Places a black line segment connecting (388, 187) to (70, 219).
; PLAN: r0=388(x1), r1=187(y1), r2=70(x2), r3=219(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 187
LDI r2, 70
LDI r3, 219
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
