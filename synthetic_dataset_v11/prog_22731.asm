; DESCRIPTION: Places a black line segment connecting (77, 14) to (152, 16).
; PLAN: r0=77(x1), r1=14(y1), r2=152(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 14
LDI r2, 152
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
