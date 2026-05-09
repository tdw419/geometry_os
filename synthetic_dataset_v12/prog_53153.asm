; DESCRIPTION: Places a black line segment connecting (426, 229) to (366, 166).
; PLAN: r0=426(x1), r1=229(y1), r2=366(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 229
LDI r2, 366
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
