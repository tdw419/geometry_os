; DESCRIPTION: Places a black line segment connecting (116, 129) to (142, 152).
; PLAN: r0=116(x1), r1=129(y1), r2=142(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 129
LDI r2, 142
LDI r3, 152
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
