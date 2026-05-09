; DESCRIPTION: Places a black line segment connecting (19, 222) to (152, 194).
; PLAN: r0=19(x1), r1=222(y1), r2=152(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 222
LDI r2, 152
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
