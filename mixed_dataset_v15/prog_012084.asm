; DESCRIPTION: Places a black line segment connecting (451, 152) to (165, 43).
; PLAN: r0=451(x1), r1=152(y1), r2=165(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 152
LDI r2, 165
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
