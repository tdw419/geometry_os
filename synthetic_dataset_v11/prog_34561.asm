; DESCRIPTION: Places a black line segment connecting (94, 152) to (189, 49).
; PLAN: r0=94(x1), r1=152(y1), r2=189(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 152
LDI r2, 189
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
