; DESCRIPTION: Places a black line segment connecting (323, 233) to (392, 136).
; PLAN: r0=323(x1), r1=233(y1), r2=392(x2), r3=136(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 233
LDI r2, 392
LDI r3, 136
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
