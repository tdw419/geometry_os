; DESCRIPTION: Places a black line segment connecting (196, 236) to (463, 47).
; PLAN: r0=196(x1), r1=236(y1), r2=463(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 236
LDI r2, 463
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
