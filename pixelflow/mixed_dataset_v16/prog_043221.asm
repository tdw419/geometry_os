; DESCRIPTION: Renders a black line between points (32, 218) and (432, 132).
; PLAN: r0=32(x1), r1=218(y1), r2=432(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 218
LDI r2, 432
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
