; DESCRIPTION: Places a black line segment connecting (140, 152) to (124, 49).
; PLAN: r0=140(x1), r1=152(y1), r2=124(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 152
LDI r2, 124
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
